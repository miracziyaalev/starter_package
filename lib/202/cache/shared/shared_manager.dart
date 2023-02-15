import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_package/202/cache/shared/shared_not_iniliaze.dart';

enum SharedKeys { counter }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) throw SharedInitiliazeException();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();

    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();

    return (await preferences?.remove(key.name)) ?? false;
  }
}
