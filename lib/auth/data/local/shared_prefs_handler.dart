import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsHandler {
  static Future<void> storeToken({required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token ?? '';
  }
}
