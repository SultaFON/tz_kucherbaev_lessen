import 'package:flutter/material.dart';
import 'package:kucherbaev_sultan_tz/data/di/get_it_servis.dart';
import 'package:kucherbaev_sultan_tz/ui/resurses/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await _goToNext();
      }
    });
  }

  Future<void> _goToNext() async {
    if (_navigated) return;
    _navigated = true;

    final isSubscribed = await getItService.sharedPreferensService.getSubscribed();

    if (!mounted) return;

    if (isSubscribed) {
      getItService.navigatorService.onHomeScreen();
    } else {
      getItService.navigatorService.onOnboardingScreen();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: const Icon(
            Icons.menu_book_rounded, // иконка "уроки"
            size: 90,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
