import 'package:currencypro/app/data/services/storage_service.dart';
import 'package:currencypro/app/theme/app_theme.dart';
import 'package:currencypro/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  Get.put(StorageService(prefs));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CurrencyPro",
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      theme: AppTheme.darkTheme,
    ),
  );
}
