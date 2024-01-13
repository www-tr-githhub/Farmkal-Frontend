import 'package:farmkal/models/sellproduct.dart';
import 'package:farmkal/services/sellproductServicers.dart';
import 'package:flutter/material.dart';

class SellProductController {
  final SellProductServices _sellProductServices = SellProductServices();

  Future<SellProduct> sellProduct(var data) async {
    try {
      var response = await _sellProductServices.postSellProduct(data);
      return sellProductFromJson(response);
    } catch (e) {
      debugPrint('SellProductController error: $e');
      throw e;
    }
  }
}
