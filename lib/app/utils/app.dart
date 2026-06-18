import 'package:flutter/material.dart';
// ১. গেটএক্স এর সঠিক ইমপোর্ট লাইন
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_system_flutter/app/routes/app_pages.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      // ২. সঠিক থিম কনফিগারেশন
      theme: ThemeData(
        useMaterial3: true, // আধুনিক ইউআই এর জন্য এটি অন রাখতে পারেন
        textTheme: GoogleFonts.oswaldTextTheme(
          Theme.of(context).textTheme, // কারেন্ট টেক্সট থিম পাস করা হলো
        ),
      ),
    );
  }
}
