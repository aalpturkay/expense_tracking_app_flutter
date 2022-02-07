import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
  static String accessTokenKey = "accessToken";
  static Future<bool> setAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(accessTokenKey, accessToken);
  }

  static Future<String> getAccessTokenFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey) ?? "";
  }

  static Future<bool> isAccessTokenEmpty() async {
    final accessToken = await getAccessTokenFromSharedPrefs();
    return accessToken.isEmpty;
  }
}
