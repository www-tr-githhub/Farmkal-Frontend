import 'dart:io';

import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/productList.dart';
import 'package:farmkal/models/recentmodel.dart';
import 'package:farmkal/models/sellproduct.dart';

import 'package:farmkal/resources/resources/app_url.dart';

class RecentProductServices {
//_ means private for thet file we cant export it
  final _apiservices = NetworkApiServices();

  Future<SellProduct> getrecent() async {
    final response = await _apiservices.getApi(AppUrl.getrecent);
    print(response);
    return SellProduct.fromJson(response);
  }
}
