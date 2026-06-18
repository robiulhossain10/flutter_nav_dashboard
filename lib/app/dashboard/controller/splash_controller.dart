import 'dart:async';

import 'package:get/get.dart';
import 'package:new_system_flutter/app/config/app_config_service.dart';
import 'package:new_system_flutter/app/dashboard/models/splash_model.dart';


class SplashController extends GetxController {
  // AppConfigService locate korchi
  final AppConfigService _configService = Get.find<AppConfigService>();
// Dot management variables
  var currentIndex = 0.obs;
  Timer? _timer;

  // UI dynamically read korbe config global service definition text model path path key path
  AppInfoModel get appData => _configService.appData;

  @override
  void onInit() {
    super.onInit();
    _startDotAnimation();
    _navigateToNextScreen();
  }

  // 2. Cycle the index from 0 -> 1 -> 2 -> 0 every 400-500ms
  void _startDotAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 450), (timer) {
      if (currentIndex.value < 2) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
    });
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offNamed('/auth'); // Your routing logic
  }

  @override
  void onClose() {
    _timer?.cancel(); // Crucial: Cancel timer to avoid memory leaks
    super.onClose();
  }
}
