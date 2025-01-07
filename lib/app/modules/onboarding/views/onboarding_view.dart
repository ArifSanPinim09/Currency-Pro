import 'package:currencypro/app/modules/onboarding/widgets/onboarding_page.dart';
import 'package:currencypro/app/modules/onboarding/widgets/progress_dots.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePage,
            children: const [
              OnboardingPage(
                illustration: 'assets/images/onboarding_1.svg',
                title: 'Welcome to CurrencyPro',
                description:
                    'Experience the future of currency conversion with real-time rates and premium features.',
                showSkip: true,
              ),
              OnboardingPage(
                illustration: 'assets/images/onboarding_2.svg',
                title: 'Smart Features',
                description:
                    'Quick conversion, multi-currency support, and live market rates at your fingertips.',
                showDemo: true,
              ),
              OnboardingPage(
                illustration: 'assets/images/onboarding_3.svg',
                title: 'Premium Experience',
                description:
                    'Unlock advanced features and enjoy a seamless currency conversion experience.',
                showPremium: true,
              ),
              OnboardingPage(
                illustration: 'assets/images/onboarding_4.svg',
                title: 'Ready to Start?',
                description:
                    'Join thousands of users and start converting currencies like a pro.',
                showCTA: true,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const ProgressDots(),
                  const SizedBox(height: 24),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.currentPage.value < 3)
                            TextButton(
                              onPressed: controller.skipOnboarding,
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: controller.currentPage.value == 3
                                ? controller.getStarted
                                : controller.nextPage,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            child: Text(
                              controller.currentPage.value == 3
                                  ? 'Get Started'
                                  : 'Next',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
