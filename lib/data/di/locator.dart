import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:kucherbaev_sultan_tz/domain/services/navigator_service.dart';
import 'package:kucherbaev_sultan_tz/domain/services/shared_preferences_service.dart';

class Locator {
  late NavigatorService navigatorService;
  late SharedPreferencesService sharedPreferencesService;
  final navigatorKey = GlobalKey<NavigatorState>();

  void _registration() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
    GetIt.I.registerSingleton<SharedPreferencesService>(sharedPreferencesService);
  }

  Locator() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);
    sharedPreferencesService = SharedPreferencesService();
    _registration();
  }
}
