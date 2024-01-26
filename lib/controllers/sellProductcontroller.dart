import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/productList.dart';
import 'package:farmkal/models/recentmodel.dart';
import 'package:farmkal/models/sellproduct.dart';
import 'package:farmkal/services/recentproductservices.dart';
import 'package:farmkal/services/sellproductServicers.dart';
import 'package:farmkal/view_models/userPrefrence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellProductController extends GetxController {
  final SellProductServices _sellProductServices = SellProductServices();
  final RecentProductServices _recentProductServices = RecentProductServices();
  //var selectedItem = ''.obs;
  //RxString selectedValue = 'One'.obs;

  RxBool loading = false.obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  UserPreference _userPreference = new UserPreference();

  final model = TextEditingController().obs;
  final brand = TextEditingController().obs;
  final tyre = TextEditingController().obs;
  final rate = TextEditingController().obs;
  final hour = TextEditingController().obs;
  final otherdetail = TextEditingController().obs;
  RxList<File> files = <File>[].obs;

  /*List<String> options = ["Tractor", "Seeddrill", "Trolly"];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;*/
  // Rx<SellProduct> sellProductData = <SellProduct>.obs;

  Rx<SellProduct> sellProductData = SellProduct().obs;
  void setsellProductData(SellProduct value) => sellProductData.value = value;

  Rx<SellProduct> getRecentproduct = SellProduct().obs;
  void setgetRecentproduct(SellProduct value) => getRecentproduct.value = value;

  Rx<ProductList> productListData = ProductList().obs;
  void setProductListData(ProductList value) => productListData.value = value;

  // void changeSelectedValue(String newValue) {
  // selectedValue.value = newValue;
  //}

  Future<void> sellProduct() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;

    var data = {
      "name": model.value.text,
      //"catagory": selectedOptionList.value,
      // "image": base64Encode(files[0].readAsBytesSync()),
      "brand": brand.value.text,
      "tyre": tyre.value.text,
      "rate": rate.value.text,
      "hour": hour.value.text,
      "otherdetail": otherdetail.value.text,
    };

    print(data);

    try {
      final token = await _userPreference.getToken();
      print(token.toString());

      var response = await _sellProductServices.postSellProduct(
          data, files, token.toString());
      setsellProductData(response);
      Get.snackbar(
          "Successfully Posted", "You have successfully post your product");
      rxRequestStatus.value = Status.COMPLETED;
      loading.value = false;
    } catch (e) {
      print("Error: " + e.toString());
      rxRequestStatus.value = Status.COMPLETED;
      loading.value = false;
    }
  }

  Future<void> getproductListData() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;
    try {
      final response = await _sellProductServices.getProductList();

      print("data set");
      setProductListData(response);

      rxRequestStatus.value = Status.COMPLETED;

      loading.value = false;
    } catch (error) {
      rxRequestStatus.value = Status.COMPLETED;

      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }

  Future<void> getrecentproduct() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;
    try {
      final response = await _recentProductServices.getrecent();

      print("data set");
      setgetRecentproduct(response);
      print("tanisha");
      rxRequestStatus.value = Status.COMPLETED;

      loading.value = false;
    } catch (error) {
      rxRequestStatus.value = Status.COMPLETED;

      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }
}
