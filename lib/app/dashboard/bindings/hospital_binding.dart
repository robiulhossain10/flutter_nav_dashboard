import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/hospital_conroller.dart';

class HospitalBinding extends Bindings {

  @override
  void dependencies() {


    Get.lazyPut<HospitalConroller>(
      () => HospitalConroller(),
    );
  }
}
