import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", token);
    return true;
  }

  Future<bool> saveNumber(String number) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("number", number);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? tokenVal = sp.getString("token");
    return tokenVal;
  }

  Future<String?> getNumber() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? tokenVal = sp.getString("number");
    return tokenVal;
  }
}
