import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/models/login_model.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';
import 'package:new_system_flutter/app/utils/app_snacbar.dart';

class LoginController extends GetxController {
  final employeeIdController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final obscureText = true.obs;

  void togglePassword() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login() async {
    if (employeeIdController.text.isEmpty) {
      Get.snackbar("Error", "Employee ID Required");
      return;
    }

    if (passwordController.text.isEmpty) {
      Get.snackbar("Error", "Password Required");
      return;
    }

    LoginModel model = LoginModel(
      employeeId: employeeIdController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.toNamed(AppRoutes.home);

    print(model.toJson());

    AppSnackbar.show(
      title: 'Login',
      message: 'Success',
      type: SnackbarType.success,
    );
  }

  @override
  void onClose() {
    employeeIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
