import 'package:shared_preferences/shared_preferences.dart';

class AuthLogin {
  static Future<bool> isLoggedIn() async {
    final sheard = await SharedPreferences.getInstance();
    return sheard.getBool('isLoggedIn') ?? false;
  }
}
