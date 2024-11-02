import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasName = prefs.containsKey('name');
  if (hasName) {
    return true;
  } else {
    return false;
  }
}

Future<Object?> getAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("name");
}

Future<void> saveAccount(String name) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("name", name);
}
