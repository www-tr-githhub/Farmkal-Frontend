import 'dart:io';

import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/sellproduct.dart';

import 'package:farmkal/resources/resources/app_url.dart';

class SellProductServices {
//_ means private for thet file we cant export it
  final _apiservices = NetworkApiServices();

  Future<SellProduct> postSellProduct(
      var data, List<File> files, String token) async {
    dynamic response = await _apiservices.postApiWithfiles(
        data, AppUrl.SellProduct, files, token);

    print(response);
    return SellProduct.fromJson(response);
  }
}
