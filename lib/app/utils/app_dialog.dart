import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogType {
  delete,
  success,
  error,
  warning,
  info,
  logout,
}

class AppDialog {
  static void show({
    required DialogType type,
    required String title,
    required String message,
    VoidCallback? onConfirm,
  }) {
    IconData icon;
    Color color;
    String confirmText;

    switch (type) {
      case DialogType.delete:
        icon = Icons.delete_forever;
        color = Colors.red;
        confirmText = 'Delete';
        break;

      case DialogType.success:
        icon = Icons.check_circle;
        color = Colors.green;
        confirmText = 'OK';
        break;

      case DialogType.error:
        icon = Icons.error;
        color = Colors.red;
        confirmText = 'OK';
        break;

      case DialogType.warning:
        icon = Icons.warning_amber;
        color = Colors.orange;
        confirmText = 'Continue';
        break;

      case DialogType.info:
        icon = Icons.info;
        color = Colors.blue;
        confirmText = 'OK';
        break;

      case DialogType.logout:
        icon = Icons.logout;
        color = Colors.deepPurple;
        confirmText = 'Logout';
        break;
    }

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        title: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title),
            ),
          ],
        ),

        content: Text(message),

        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Get.back();

              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
}