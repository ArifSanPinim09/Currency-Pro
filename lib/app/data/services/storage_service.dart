import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool('onboardingCompleted', value);
  }

  bool get isOnboardingCompleted {
    return _prefs.getBool('onboardingCompleted') ?? false;
  }
}
