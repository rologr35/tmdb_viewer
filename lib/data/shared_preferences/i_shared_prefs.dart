abstract class ISharedPrefs {

  Future<void> resetConfig({bool removeCredentials});

  Future<String> getString(String key, {String defValue = ""});

  Future<void> setString(String key,  {required String value});

  Future<int> getInt(String key, {int defValue = 0});

  Future<void> setInt(String key, {required int value});

  Future<double> getDouble(String key, {double defValue = 0.0});

  Future<void> setDouble(String key, {required double value});

  Future<bool> getBool(String key, {bool defValue = false});

  Future<void> setBool(String key, {required bool value});
}
