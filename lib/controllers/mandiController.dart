import 'package:farmkal/data/response/status.dart';
import 'package:farmkal/models/city-model.dart';
import 'package:farmkal/models/commodity-model.dart';
import 'package:farmkal/models/market-model.dart';
import 'package:farmkal/services/mandiServices.dart';
import 'package:get/get.dart';

class MandiController extends GetxController {
  final _api = MandiServices();
  RxBool loading = false.obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  Rx<Commodity> commidtyData = Commodity().obs;
  void setcommidtyData(Commodity value) => commidtyData.value = value;
  Rx<CityData> getCitydata = CityData().obs;
  void setgetCitydata(CityData value) => getCitydata.value = value;
  Rx<MarketData> getMarketData = MarketData().obs;
  void setgetMarketData(MarketData value) => getMarketData.value = value;

  Future<void> getCommidityData() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;
    try {
      final response = await _api.getCommodity();

      print("data set");
      setcommidtyData(response);
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }

  Future<void> getCityData() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;
    try {
      final response = await _api.getCity();

      print("data set");
      setgetCitydata(response);
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }

  Future<void> getMarketDatamethod() async {
    rxRequestStatus.value = Status.LOADING;
    loading.value = true;
    try {
      final response = await _api.getMarket();

      print("data set");
      setgetMarketData(response);
      setRxRequestStatus(Status.COMPLETED);
      loading.value = false;
    } catch (error) {
      setRxRequestStatus(Status.ERROR);
      print(error);
      Get.snackbar(
          'Your work has not been completed', "please try after sometime");
      loading.value = false;
    }
  }
}
