import 'package:flutter/material.dart';
import 'package:kucherbaev_sultan_tz/data/di/get_it_services.dart';
import 'package:kucherbaev_sultan_tz/ui/resurses/colors.dart';
import 'package:kucherbaev_sultan_tz/ui/resurses/image.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> titles = ["Все уроки в одном месте", "Успевай всё"];
  final List<String> subTitles = [
    "храни и открывай свои уроки быстро и удобно",
    "следи за расписанием и важными для тебя занятиями",
  ];

  final List<String> images = [
    AppImage.oneOnboardingImage,
    AppImage.twoOnboardingImage,
  ];

  void _nextPage() {
    if (_currentPage == 1) {
      getItService.navigatorService.onPaywallScreen();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(images[index], height: 280),
                      const SizedBox(height: 30),
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subTitles[index],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                final isActive = index == _currentPage;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: isActive ? 24 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _nextPage,
                  child: Text(_currentPage == 1 ? "Начать" : "Продолжить"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
