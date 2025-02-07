import 'package:currencypro/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF2D2B52),
                  Color(0xFF1A1A2E),
                ],
                stops: [0.1, 0.9],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Animation
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 2),
                    builder: (context, value, child) {
                      return Transform.rotate(
                        angle: value * 2 * 3.14,
                        child: Opacity(
                          opacity: value,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                              ),
                            ),
                            child: Icon(
                              Icons.currency_exchange,
                              size: 60,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Text Animation
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const Text(
                          'CurrencyPro',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
