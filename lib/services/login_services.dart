import 'package:farmkal/data/network/network_api_services.dart';
import 'package:farmkal/models/userdata-model.dart';
import 'package:farmkal/resources/resources/app_url.dart';

class LoginServices {
  //_ means private for thet file we cant export it
  final _apiservices = NetworkApiServices();

  Future<Userdata> postRegister(var data) async {
    dynamic response = await _apiservices.postApi(data, AppUrl.register);

    print(response);
    return Userdata.fromJson(response);
  }

  Future<Userdata> postLogin(var data) async {
    dynamic response = await _apiservices.postApi(data, AppUrl.loginApi);

    print(response);
    return Userdata.fromJson(response);
  }
}
