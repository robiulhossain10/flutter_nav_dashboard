import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/config/loading_service.dart';
import 'package:new_system_flutter/app/dashboard/models/login_model.dart';
import 'package:new_system_flutter/app/dashboard/views/main_screen.dart';
import 'package:new_system_flutter/app/utils/app_snacbar.dart';

class LoginController extends GetxController {
  final employeeIdController = TextEditingController();
  final passwordController   = TextEditingController();

  final isLoading   = false.obs;
  final obscureText = true.obs;

  void togglePassword() => obscureText.value = !obscureText.value;

  Future<void> login() async {

    // ── Validation first — loading শুরুর আগে ──────────────
    if (employeeIdController.text.trim().isEmpty) {
      AppSnackbar.show(
        title: 'Error',
        message: 'Employee ID is required',
        type: SnackbarType.error,
      );
      return;
    }

    if (passwordController.text.trim().isEmpty) {
      AppSnackbar.show(
        title: 'Error',
        message: 'Password is required',
        type: SnackbarType.error,
      );
      return;
    }

    // ── Loading শুরু — validation পাস হলে ─────────────────
    try {
      isLoading.value = true;

      final LoginModel model = LoginModel(
        employeeId: employeeIdController.text.trim(),
        password:   passwordController.text.trim(),
      );

      // TODO: replace with actual API call
      await Future.delayed(const Duration(seconds: 2));

      print(model.toJson());

      AppSnackbar.show(
        title: 'Login',
        message: 'Login successful',
        type: SnackbarType.success,
      );

      // ── offAllNamed ব্যবহার করতে হবে ──────────────────
      // Get.toNamed() → back press এ login এ ফিরে যায় (bug)
      // Get.offAllNamed() → stack সম্পূর্ণ clear হয়
      await Get.offAll( MainScreen());

    } catch (e) {
      AppSnackbar.show(
        title: 'Error',
        message: 'Login failed. Please try again.',
        type: SnackbarType.error,
      );
    } finally {
      // ── finally block — সবসময় loading বন্ধ হবে ────────
      isLoading.value = false;
      LoadingService.hide();
    }
  }

  @override
  void onClose() {
    employeeIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
