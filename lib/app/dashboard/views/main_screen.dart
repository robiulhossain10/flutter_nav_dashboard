import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
import 'package:new_system_flutter/app/dashboard/views/aproval_slider.dart';
import 'package:new_system_flutter/app/dashboard/views/arafat_view.dart';
import 'package:new_system_flutter/app/dashboard/views/test_view.dart';

import 'hrms_dashboard.dart';

class MainScreen extends GetView<NavController> {
  MainScreen({super.key});

  // ৫টি স্ক্রিনের লিস্ট (মাঝখানে Attendance View যোগ করা হয়েছে)
  final List<Widget> pages = [
    const HRMSDashboard(),
    const ApprovalView(),
    const Center(
      child: Text('Attendance Screen'),
    ), // আপনার Attendance View টি এখানে দিন
    const ArafatView(), // Payroll হিসেবে ব্যবহার করতে পারেন
    const TestView(), // Profile হিসেবে ব্যবহার করতে পারেন
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // IndexedStack আপনার পেজের স্টেট ধরে রাখবে
      body: Obx(
        () =>
            IndexedStack(index: controller.currentIndex.value, children: pages),
      ),

      // 🔥 মাঝখানের বড় ভাসমান Attendance বাটন (FAB)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        final isSelected = controller.currentIndex.value == 2;
        return Container(
          height: 68,
          width: 68,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(22),
            color: Colors.red, // লাল ব্যাকগ্রাউন্ড
            boxShadow: [
              BoxShadow(
                color: Colors.red.withValues(alpha: 0.4),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () => controller.changePage(2), // Attendance index 2
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield_outlined, // ইমেজের মতো Shield আইকন
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        );
      }),

      // 🔥 কাস্টম বটম নেভিগেশন বার
      bottomNavigationBar: BottomAppBar(
        shape:
            const CircularNotchedRectangle(), // মাঝখানে FAB এর জন্য স্পেস বানাবে
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        elevation: 20,
        shadowColor: Colors.black.withValues(alpha: 0.5),
        color: Colors.white,
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // বাম পাশের ২টি বাটন
                _buildNavItem(index: 0, icon: Icons.home_filled, label: 'Home'),
                _buildNavItem(
                  index: 1,
                  icon: Icons.navigation_outlined,
                  label: 'Approval',
                ),

                // মাঝখানের FAB এর জন্য ফাঁকা জায়গা (Space Holder)
                const SizedBox(width: 40),

                // ডান পাশের ২টি বাটন
                _buildNavItem(
                  index: 3,
                  icon: Icons.credit_card,
                  label: 'Payroll',
                ),
                _buildNavItem(
                  index: 4,
                  icon: Icons.person_outline_rounded,
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // বাটন তৈরি করার হেল্পার মেথড
  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = controller.currentIndex.value == index;
    final color = isSelected ? Colors.red : Colors.grey.shade400;

    return Expanded(
      child: InkWell(
        onTap: () => controller.changePage(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            // একটিভ আইটেমের নিচের লাল ইন্ডিকেটর লাইন
            Container(
              height: 3,
              width: 15,
              decoration: BoxDecoration(
                color: isSelected ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
