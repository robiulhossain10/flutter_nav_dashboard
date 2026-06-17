import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/utils/app_snacbar.dart';

class LoginController extends GetxController {
  // টেক্সট এডিটিং কন্ট্রোলার
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // গ্লোবাল ফর্ম কি (Validation এর জন্য)
  final loginFormKey = GlobalKey<FormState>();

  // পাসওয়ার্ড হাইড/শো করার জন্য Observable (obs) ভ্যারিয়েবল
  var isPasswordHidden = true.obs;

  // লোডিং স্টেট হ্যান্ডেল করার জন্য
  var isLoading = false.obs;

  // পাসওয়ার্ডের ভিজিবিলিটি চেঞ্জ করার মেথড
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // লগইন মেথড
  void login() async {
    // ফর্ম ভ্যালিডেশন চেক
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // এখানে তোমার API কল বা ব্যাকএন্ড লজিক হবে
        // উদাহরণস্বরূপ একটি ফেক ডিলে (Delay) দেওয়া হলো
        await Future.delayed(const Duration(seconds: 2));

        // সফল হলে মেসেজ এবং নেভিগেশন
        AppSnackbar.show(
          title: 'Login',
          message: 'Successful',
          type: SnackbarType.success,
        );

        Get.toNamed('/home');

        // হোম পেজে যাওয়ার জন্য (ধরে নিলাম HomeView আছে)
        // Get.offAll(() => HomeView());
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    // মেমোরি লিক রোধ করতে কন্ট্রোলার ক্লোজ করা
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
