import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
import 'package:new_system_flutter/app/dashboard/views/aproval_slider.dart';
import 'package:new_system_flutter/app/dashboard/views/arafat_view.dart';
import 'package:new_system_flutter/app/dashboard/views/test_view.dart';

import 'hrms_dashboard.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    HRMSDashboard(),
    ApprovalView(),
    ArafatView(),
    TestView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // 🔥 IndexedStack keeps state + navbar constant
      body: Obx(
        () => IndexedStack(
          index: navController.currentIndex.value,
          children: pages,
        ),
      ),

      // 🔥 Persistent Bottom NavBar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Obx(
            () => GNav(
              gap: 8,
              activeColor: Colors.blueAccent,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: Colors.blue.shade50,
              color: Colors.grey[600],

              selectedIndex: navController.currentIndex.value,

              onTabChange: (index) {
                navController.changePage(index);
              },

              tabs: const [
                GButton(
                  icon: Icons.grid_view_outlined,
                  text: 'Home',
                  rippleColor: Colors.deepOrangeAccent,
                  iconColor: Colors.green,
                ),
                GButton(
                  icon: Symbols.verified_user_rounded,
                  text: 'Approval',
                  iconColor: Colors.purpleAccent,
                  iconActiveColor: Colors.red,
                  rippleColor: Colors.redAccent,
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Leave',
                  iconColor: Colors.lightBlueAccent,
                  rippleColor: Colors.purple,
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: 'Profile',
                  iconColor: Colors.yellowAccent,
                  rippleColor: Colors.purple,
                  iconActiveColor: Colors.lightGreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
