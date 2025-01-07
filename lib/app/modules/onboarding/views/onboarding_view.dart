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
          ),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePage,
            children: const [
              OnboardingPage(
                illustration: 'assets/images/onboarding_1.svg',
                title: 'Selamat Datang di CurrencyPro',
                description:
                    'Rasakan pengalaman konversi mata uang masa depan dengan kurs real-time dan fitur premium.',
                showSkip: true,
              ),
              OnboardingPage(
                illustration: 'assets/images/onboarding_2.svg',
                title: 'Fitur Unggulan',
                description:
                    'Konversi cepat, dukungan multi mata uang, dan kurs pasar langsung dalam genggaman Anda.',
                showDemo: true,
              ),
              OnboardingPage(
                illustration: 'assets/images/onboarding_3.svg',
                title: 'Pengalaman Premium',
                description:
                    'Buka fitur-fitur canggih dan nikmati pengalaman konversi mata uang yang mulus.',
                showPremium: true,
              ),
              OnboardingPage(
                illustration: 'assets/images/onboarding_4.svg',
                title: 'Siap Memulai?',
                description:
                    'Bergabung dengan ribuan pengguna dan mulai konversi mata uang seperti profesional.',
                showCTA: true,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF1A1A2E).withOpacity(0.9),
                    const Color(0xFF1A1A2E),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ProgressDots(),
                  const SizedBox(height: 32),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.currentPage.value < 3)
                            TextButton(
                              onPressed: controller.skipOnboarding,
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFFB4B4FF),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              child: const Text(
                                'Lewati',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          const Spacer(),
                          TextButton(
                            onPressed: controller.currentPage.value == 3
                                ? controller.getStarted
                                : controller.nextPage,
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF6C63FF),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.currentPage.value == 3
                                      ? 'Mulai Sekarang'
                                      : 'Lanjut',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                if (controller.currentPage.value < 3) ...[
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                  ),
                                ],
                              ],
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
