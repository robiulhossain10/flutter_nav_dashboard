import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/views/main_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // ৩ সেকেন্ডের কৃত্রিম বিরতি
    await Future.delayed(const Duration(seconds: 3));

    // যদি আপনার main.dart-এ Named Route সেট করা থাকে, তবে এটি ব্যবহার করা সেরা:
    // Get.offAllNamed(AppRoutes.MAIN);

    // বিকল্প (Named Route ছাড়া নিরাপদ নেভিগেশন):
    Get.offAll(
      () => MainScreen(),
      predicate: (route) => false, // পূর্ববর্তী সব রুট মেমোরি থেকে নিশ্চিতভাবে মুছে দেবে
    );
  }
}
