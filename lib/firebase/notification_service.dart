import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// অ্যাপ যখন ব্যাকগ্রাউন্ডে বা একদম বন্ধ (Killed) থাকবে, তখন এই ফাংশনটি নোটিফিকেশন রিসিভ করবে
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("ব্যাকগ্রাউন্ডে নোটিফিকেশন এসেছে: ${message.notification?.title}");
}

class NotificationService extends GetxService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<NotificationService> init() async {
    // ১. নোটিফিকেশন পারমিশন চাওয়া (Android 13+ এবং iOS এর জন্য জরুরি)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('ইউজার নোটিফিকেশন পারমিশন দিয়েছেন!');
      
      // ২. আপনার ডিভাইসের ইউনিক FCM টোকেন নেওয়া
      String? token = await _fcm.getToken();
      print("================ FCM DEVICE TOKEN ================");
      print(token);
      print("==================================================");

      // 🎯 [নতুন সংযোজন] সবাইকে একসাথে মেসেজ পাঠানোর জন্য গ্লোবাল টপিকে সাবস্ক্রাইব করা
      // অ্যাপটি রান হওয়ার সাথে সাথে ইউজার এই চ্যানেলে অটোমেটিক জয়েন হয়ে যাবে
      await _fcm.subscribeToTopic('all_users');
      print("সফলভাবে 'all_users' টপিকে সাবস্ক্রাইব করা হয়েছে!");

      // ৩. ব্যাকগ্রাউন্ড হ্যান্ডলার রেজিস্টার করা
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // ৪. ফোরগ্রাউন্ড হ্যান্ডলার (যখন ইউজার অ্যাপ ওপেন করে স্ক্রিনে থাকবে)
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  if (message.notification != null) {
    Get.snackbar(
      message.notification!.title ?? 'নতুন নোটিফিকেশন',
      message.notification!.body ?? '',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 4),
      
      // 🎯 গুগল স্টাইল প্রফেশনাল ডিজাইন সেটিংস
      backgroundColor: const Color(0xFF1E1E1E).withOpacity(0.95), // স্লিক ডার্ক ব্যাকগ্রাউন্ড
      colorText: const Color(0xFFFFFFFF), // সাদা টেক্সট
      borderRadius: 12, // গুগল স্ট্যান্ডার্ড রাউন্ডেড কর্নার
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      boxShadows: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          blurRadius: 10,
          offset: const Offset(0, 4),
        )
      ],
      
      // 💡 বামপাশে একটি নোটিফিকেশন বেল আইকন
      icon: const Padding(
        padding: EdgeInsets.only(left: 4),
        child: Icon(
          Icons.notifications_active_outlined, 
          color: Color(0xFF4285F4), // গুগল ব্লু কালার
          size: 26,
        ),
      ),
      
      // ডেবাক মোডের লাল/নীল ডিফল্ট বর্ডার রিমুভ করার জন্য
      borderWidth: 0,
    );
  }
});
    }
    return this;
  }
}