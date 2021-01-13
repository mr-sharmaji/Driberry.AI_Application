import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences prefs;

  Future<bool> getLoggedInStatus() async {
    prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  void setLoggedInStatus() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
  }

  void removeLoggedInStatus() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }
}