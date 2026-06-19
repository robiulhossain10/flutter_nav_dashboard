import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/firebase/notification_service.dart';
import 'package:new_system_flutter/firebase_options.dart';

class AppInitializer {
  static Future<void> init() async {
    try {

      // 🔹 Firebase init
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // 🔹 App Check
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.appAttest,
      );

      // 🔹 Background notification (non-blocking)
      Get.putAsync(() => NotificationService().init());
    } catch (e) {
      debugPrint("Init error (ignored): $e");
    }
  }
}