import 'package:currencypro/app/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final RxBool isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      await _authRepository.signInWithGoogle();
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal masuk. Silakan coba lagi.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
