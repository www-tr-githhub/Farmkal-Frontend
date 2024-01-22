import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/city-model.dart';
import 'package:farmkal/models/commodity-model.dart';
import 'package:farmkal/models/mandidata_model.dart';
import 'package:farmkal/models/market-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';

class MandiServices {
  final _api = NetworkApiServices();

  Future<Commodity> getCommodity() async {
    final response = await _api.getApi(AppUrl.commodity);
    print(response);
    return Commodity.fromJson(response);
  }

  Future<MandiData> getMandi() async {
    print(
        "https://cr5pww-4000.csb.app/api/v1/mandidata?state=Rajasthan&city=Kota&commodity=Garlic");
    final response = await _api.getApi(AppUrl.mandidata);
    print(response);
    return MandiData.fromJson(response);
  }

  Future<CityData> getCity() async {
    final response = await _api.getApi(AppUrl.city);
    print(response);
    return CityData.fromJson(response);
  }

  Future<MarketData> getMarket() async {
    final response = await _api.getApi(AppUrl.market);
    print(response);
    return MarketData.fromJson(response);
  }
}
