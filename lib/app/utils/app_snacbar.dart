import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, warning, info }

class AppSnackbar {
  static void show({
    required String title,
    required String message,
    required SnackbarType type,
  }) {
    Color backgroundColor;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = Colors.green;
        break;

      case SnackbarType.error:
        backgroundColor = Colors.red;
        break;

      case SnackbarType.warning:
        backgroundColor = Colors.orange;
        break;

      case SnackbarType.info:
        backgroundColor = Colors.blue;
        break;
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }
}
