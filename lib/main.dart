import 'package:flutter/material.dart';
import 'package:kucherbaev_sultan_tz/route.dart';
import 'package:kucherbaev_sultan_tz/ui/screens/splash_screen/splash_screen.dart';

import 'data/di/locator.dart';

void main() {
  final locator = Locator();
  runApp(MyApp(locator: locator));
}

class MyApp extends StatelessWidget {
  final Locator locator;

  const MyApp({super.key, required this.locator});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          surface: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
      ),
      home: SplashScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      navigatorKey: locator.navigatorKey,
    );
  }
}
