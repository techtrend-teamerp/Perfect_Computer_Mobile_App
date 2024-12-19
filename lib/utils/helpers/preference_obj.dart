import 'package:shared_preferences/shared_preferences.dart';
import 'package:perfect_computer/constants/preferences_constants.dart';

class PreferenceObj {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return;
  }

  static Future<void> clearPreferenceDataAndLogout() async {
    await _sharedPreferences.clear();
    return;
  }

  static bool get getIsLogin =>
      _sharedPreferences.getBool(
        PreferencesConstants.isLogin,
      ) ??
      false;

  static Future<bool> setIsLogin({required bool isLoggedIn}) async =>
      _sharedPreferences.setBool(
        PreferencesConstants.isLogin,
        isLoggedIn,
      );

  static String? get getUserId =>
      _sharedPreferences.getString(PreferencesConstants.userId);

  static Future<bool> setUserId({required int userId}) async =>
      _sharedPreferences.setInt(
        PreferencesConstants.userId,
        userId,
      );

  static String? get getUserName =>
      _sharedPreferences.getString(PreferencesConstants.userName);

  static Future<bool> setUserName({required String userName}) async =>
      _sharedPreferences.setString(
        PreferencesConstants.userName,
        userName,
      );

  static String? get getFullName =>
      _sharedPreferences.getString(PreferencesConstants.fullName);

  static Future<bool> setFullName({required String fullName}) async =>
      _sharedPreferences.setString(
        PreferencesConstants.fullName,
        fullName,
      );

  static String? get getEmail =>
      _sharedPreferences.getString(PreferencesConstants.email);

  static Future<bool> setEmail({required String email}) async =>
      _sharedPreferences.setString(
        PreferencesConstants.email,
        email,
      );

  static String? get getPhoneNumber =>
      _sharedPreferences.getString(PreferencesConstants.phoneNumber);

  static Future<bool> setPhoneNumber({required String phoneNumber}) async =>
      _sharedPreferences.setString(
        PreferencesConstants.phoneNumber,
        phoneNumber,
      );
}
