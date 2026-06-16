import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // প্রোডাকশন ফিক্স: lazyPut পরিবর্তন করে put করা হলো
    Get.put<SplashController>(SplashController());
  }
}
