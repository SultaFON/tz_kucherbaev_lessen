import 'package:flutter/material.dart';
import 'package:kucherbaev_sultan_tz/data/di/get_it_services.dart';
import 'package:kucherbaev_sultan_tz/ui/resurses/colors.dart';
import 'package:kucherbaev_sultan_tz/ui/screens/paywall_screen/widgets/cards_plan.dart';
import 'package:kucherbaev_sultan_tz/ui/screens/paywall_screen/widgets/gialog_widget.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  String selectedPlan = 'month';

  Future<void> _onBuySuccess() async {
    await getItService.sharedPreferencesService.setSubscribed(true);

    if (!mounted) return;
  }

  void _next() {
    final planText = selectedPlan == "month"
        ? "Оформлена подписка на 1 месяц "
        : "Оформлена подписка со скидкой на 1 год";
    _onBuySuccess();
    getItService.navigatorService.onHomeScreen();
    showDialog(
      context: context,
      builder: (_) {
        return DialogWidget(planText: planText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMonth = selectedPlan == 'month';
    final isYear = selectedPlan == 'year';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Подписка",),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Выберите подписку",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            CardsPlan(
              title: "1 месяц",
              price: "4.99 \$",
              value: "month",
              isSelected: isMonth,
              onTap: () {
                setState(() {
                  selectedPlan = "month";
                });
              },
            ),

            CardsPlan(
              title: "1 год (−40%)",
              price: "39.99 \$",
              value: "year",
              isSelected: isYear,
              onTap: () {
                setState(() {
                  selectedPlan = "year";
                });
              },
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: _next,
                child: const Text("Продолжить"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
