import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:new_system_flutter/app/config/app_config_service.dart';
import 'package:new_system_flutter/app/config/app_init.dart';
import 'package:new_system_flutter/app/utils/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    // 🔹 Local config first
      await Get.putAsync(() => AppConfigService().init());
  // 🔥 STEP 1: Run app FIRST (fast UI boot strategy)
  runApp(const MyApp());

    // 🔥 background init
  AppInitializer.init();
}