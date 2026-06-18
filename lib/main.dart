import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:new_system_flutter/app/config/app_config_service.dart';
import 'package:new_system_flutter/app/utils/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // App start hobar shurutei service load korbe
  await Get.putAsync(() => AppConfigService().init());
  runApp(const MyApp());
}


