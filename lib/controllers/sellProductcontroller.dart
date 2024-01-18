import 'dart:convert';
import 'dart:io';

import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/productList.dart';
import 'package:farmkal/models/sellproduct.dart';
import 'package:farmkal/services/sellproductServicers.dart';
import 'package:farmkal/view_models/userPrefrence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellProductController extends GetxController {
  final SellProductServices _sellProductServices = SellProductServices();
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

  // Rx<SellProduct> sellProductData = <SellProduct>.obs;

  Rx<SellProduct> sellProductData = SellProduct().obs;
  void setsellProductData(SellProduct value) => sellProductData.value = value;

  Rx<ProductList> productListData = ProductList().obs;
  void setProductListData(ProductList value) => productListData.value = value;

  Future<void> sellProduct() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;

    var data = {
      "name": model.value.text,
      // "image": files.value,
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
}
