import 'package:currencypro/app/data/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final PageController pageController = PageController();
  final currentPage = 0.obs;

  void updatePage(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    _completeOnboarding();
  }

  void getStarted() {
    _completeOnboarding();
  }

  void _completeOnboarding() async {
    await _storageService.setOnboardingCompleted(true);
    Get.offAllNamed('/auth');
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
