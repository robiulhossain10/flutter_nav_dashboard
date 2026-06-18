import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:new_system_flutter/app/config/app_config_service.dart';
import 'package:new_system_flutter/app/utils/app.dart';
import 'package:new_system_flutter/firebase/notification_service.dart';
import 'package:new_system_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // App start hobar shurutei service load korbe
  await Get.putAsync(() => AppConfigService().init());

  // ১. ফায়ারবেস প্রজেক্ট ইনিশিয়ালাইজ করা
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // ২. নোটিফিকেশন সার্ভিসটি অ্যাপের ব্যাকগ্রাউন্ডে ইনজেক্ট করা
  await Get.putAsync(() => NotificationService().init());
  runApp(const MyApp());
}
