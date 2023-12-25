import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", token);
    return true;
  }

  Future<String> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String tokenVal = sp.getString("token")!;
    return tokenVal;
  }
}
