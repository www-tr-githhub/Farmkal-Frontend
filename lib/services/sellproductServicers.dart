import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/sellproduct.dart';

import 'package:farmkal/resources/resources/app_url.dart';

class SellProductServices {
//_ means private for thet file we cant export it
  final _apiservices = NetworkApiServices();

  Future postSellProduct(var data) async {
    dynamic response = await _apiservices.postApi(data, AppUrl.SellProduct);

    print(response);
    return SellProduct.fromJson(response);
  }
}
