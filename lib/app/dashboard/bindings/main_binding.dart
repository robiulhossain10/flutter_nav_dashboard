import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
// আপনার যদি ড্যাশবোর্ডের আলাদা কন্ট্রোলার থাকে, সেটিও এখানে ইমপোর্ট করবেন

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut ব্যবহারের ফলে স্ক্রিনে না যাওয়া পর্যন্ত এটি মেমোরি নেবে না
    Get.lazyPut<NavController>(() => NavController());
  }
}
