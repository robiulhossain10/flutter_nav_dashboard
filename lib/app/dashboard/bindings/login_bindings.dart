import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/login_controller.dart';

class LoginBindings extends Bindings {

  @override
  void dependencies() {


    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
