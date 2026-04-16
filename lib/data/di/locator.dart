import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:kucherbaev_sultan_tz/domain/services/navigator_service.dart';
import 'package:kucherbaev_sultan_tz/domain/services/shared_preferens_service.dart';

class Locator {
  late NavigatorService navigatorService;
  late SharedPreferensService sharedPreferensService;
  final navigatorKey = GlobalKey<NavigatorState>();

  void _registeration() {
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
    GetIt.I.registerSingleton<SharedPreferensService>(sharedPreferensService);
  }

  Locator() {
    navigatorService = NavigatorService(navigatorKey: navigatorKey);
    sharedPreferensService = SharedPreferensService();
    _registeration();
  }
}
