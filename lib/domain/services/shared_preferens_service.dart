import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferensService {
  static const _isSubscribedKey = "is_subscribed";


  Future<bool> getSubscribed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isSubscribedKey) ?? false;
  }




  Future<void> setSubscribed(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isSubscribedKey, value);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}