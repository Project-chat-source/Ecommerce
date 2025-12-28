import 'package:shared_preferences/shared_preferences.dart';

class Localstorage {
  final SharedPreferences pref;

  const Localstorage({required this.pref});

  Future<void> setValue(String key, dynamic value) async {
    switch (value) {
      case String v:
        await pref.setString(key, v);
        break;
      case int v:
        await pref.setInt(key, v);
        break;
      case bool v:
        await pref.setBool(key, v);
        break;
      case double v:
        await pref.setDouble(key, v);
        break;
      case List<String> v:
        await pref.setStringList(key, v);
        break;
    }
  }

  Future<T?> getValue<T>(String key) async {
    return pref.get(key) as T?;
  }

  Future<void> clear() async {
    await pref.clear();
  }
}
