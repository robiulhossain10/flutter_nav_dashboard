import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

// আপনার AppRoutes ফাইলের ইমপোর্ট পাথটি এখানে দিন
// import 'package:new_system_flutter/app/routes/app_routes.dart';

import 'hrms_dashboard.dart';

class MainScreen extends StatelessWidget {
  final NavController navController = Get.put<NavController>(NavController());

  // এখানে বডিতে শুধুমাত্র ড্যাশবোর্ড থাকবে, কারণ বাকিগুলো আলাদা রুটে চলে যাবে
  final List<Widget> pages = [HRMSDashboard()];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // হোম পেজ লোড করার জন্য সর্বদা index 0 ই থাকবে
      body: pages[0],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Obx(
            () => GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.blueAccent,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[50]!,
              color: Colors.grey[600],
              tabs: const [
                GButton(icon: Icons.dashboard_outlined, text: 'Home'),
                GButton(icon: Icons.fingerprint, text: 'Attendance'),
                GButton(icon: Icons.calendar_month_outlined, text: 'Leave'),
                GButton(icon: Icons.person_outline, text: 'Profile'),
              ],
              // কন্ট্রোলার থেকে রিয়েল-টাইম সিলেক্টেড ইনডেক্স ট্র্যাক করবে
              selectedIndex: navController.currentIndex.value,
              onTabChange: (index) async {
                // ইউজার অলরেডি হোমে থাকলে আর কিছুই করার দরকার নেই
                if (index == 0) {
                  navController.changePage(0);
                  return;
                }

                // ইউজার অন্য ট্যাবে ক্লিক করলে প্রথমে বারটিকে হোমে ব্যাক করানোর জন্য প্রস্তুত রাখুন
                // কারণ এই পেজগুলো আলাদা ফুল-স্ক্রিন রুট হিসেবে ওপেন হচ্ছে
                String targetRoute = '';
                if (index == 1) targetRoute = AppRoutes.details;
                if (index == 2) targetRoute = AppRoutes.hospital;
                if (index == 3) targetRoute = AppRoutes.users;

                if (targetRoute.isNotEmpty) {
                  // ১. প্রথমে ন্যাভিগেশন বারকে ভিজ্যুয়ালি হোমে ধরে রাখুন যেন লুপ না হয়
                  navController.changePage(0);

                  // ২. এবার নতুন পেজে চলে যান
                  Get.toNamed(targetRoute);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
