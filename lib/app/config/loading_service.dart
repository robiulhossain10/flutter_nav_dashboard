import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingService {
  static bool _isLoading = false;

  static void show([String message = 'Loading...']) {
    if (_isLoading) return;

    _isLoading = true;

    Get.dialog(
      PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(message),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (!_isLoading) return;

    _isLoading = false;

    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
