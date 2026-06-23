import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
import 'package:new_system_flutter/app/dashboard/views/main_screen.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // ✅ lazyPut এর বদলে put — navigate করার সাথে সাথে ready থাকবে
    Get.put<NavController>(NavController(), permanent: false);
  }
}
