
import 'package:shared_preferences/shared_preferences.dart';
import 'i_shared_prefs.dart';

class SharedPrefs extends ISharedPrefs {

  @override
  Future<void> resetConfig({bool removeCredentials = true}) async {}

  @override
  Future<bool> getBool(String key, {bool defValue = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key);
    value ??= defValue;
    return value;
  }

  @override
  Future<double> getDouble(String key, {double defValue = 0.0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? value = prefs.getDouble(key);
    value ??= defValue;
    return value;
  }

  @override
  Future<int> getInt(String key, {int defValue = 0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(key);
    value ??= defValue;
    return value;
  }

  @override
  Future<String> getString(String key, {String defValue = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    value ??= defValue;
    return value;
  }

  @override
  Future<void> setBool(String key, {required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Future<void> setDouble(String key, {required double value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, {required int value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  @override
  Future<void> setString(String key, {required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
