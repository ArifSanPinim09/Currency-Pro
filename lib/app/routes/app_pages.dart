import 'package:currencypro/app/modules/home/bindings/home_binding.dart';
import 'package:currencypro/app/modules/home/views/home_view.dart';
import 'package:currencypro/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:currencypro/app/modules/onboarding/views/onboarding_view.dart';
import 'package:currencypro/app/modules/splash/bindings/splash_binding.dart';
import 'package:currencypro/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
