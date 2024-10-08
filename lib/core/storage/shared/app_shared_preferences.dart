import 'package:shared_preferences/shared_preferences.dart';

import '../../resource/app_key.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
abstract class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  static clear() {
    _sharedPreferences.clear();
  }

  static cashLanguage({required String language}) {
    _sharedPreferences.setString(AppKey.language, language);
  }

  static String getLanguage() {
    return _sharedPreferences.getString(AppKey.language) ?? "en";
  }

  static void cashLoggedIn({required bool isLoggedIn}) {
    _sharedPreferences.setBool(AppKey.isLoggedIn, isLoggedIn);
  }

  static bool isLoggedIn() {
    return _sharedPreferences.getBool(AppKey.isLoggedIn) ?? false;
  }
}
