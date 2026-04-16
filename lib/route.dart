import 'package:flutter/material.dart';
import 'package:kucherbaev_sultan_tz/ui/screens/home_screen/home_screen.dart';
import 'package:kucherbaev_sultan_tz/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:kucherbaev_sultan_tz/ui/screens/paywall_screen/paywall_screen.dart';

class AppRoutes {
  static const paywallScreen = '/paywall-screen';
  static const homeScreen = '/home-screen';
  static const onboardingScreen = '/onboarding-screen';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      AppRoutes.paywallScreen: (BuildContext context) => PaywallScreen(),
      AppRoutes.homeScreen: (BuildContext context) => HomeScreen(),
      AppRoutes.onboardingScreen: (BuildContext context) => OnboardingScreen(),
  };
    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(builder: (x)=>builder
    !
    (
    x
    )
    );

  }

}