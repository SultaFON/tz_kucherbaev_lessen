import 'package:flutter/cupertino.dart';
import 'package:kucherbaev_sultan_tz/route.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService({required this.navigatorKey});

  void onPop() => navigatorKey.currentState!.pop();

  bool canPop() => navigatorKey.currentState!.canPop();

  void onFirst() =>
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

  void onPaywallScreen() {
    onFirst();
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.paywallScreen,
      (route) => false,
    );
  }

  void onHomeScreen() {
    onFirst();
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.homeScreen,
      (route) => false,
    );
  }  void onOnboardingScreen() {
    onFirst();
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.onboardingScreen,
      (route) => false,
    );
  }
}
