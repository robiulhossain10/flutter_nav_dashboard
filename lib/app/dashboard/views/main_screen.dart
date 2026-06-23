import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
import 'package:new_system_flutter/app/dashboard/models/try_get.dart';
import 'package:new_system_flutter/app/dashboard/views/aproval_slider.dart';
import 'package:new_system_flutter/app/dashboard/views/arafat_view.dart';
import 'package:new_system_flutter/app/dashboard/views/hrms_dashboard.dart';
import 'package:new_system_flutter/app/dashboard/views/test_view.dart';

// ============================================================
// NavController
// ============================================================


// ============================================================
// MainScreen
// ✅ FIX: GetView বাদ — Get.find() দিয়ে controller নেওয়া
//         যাতে binding ছাড়াও কাজ করে
// ============================================================
class MainScreen extends StatelessWidget {
  MainScreen({super.key}) {
    // ✅ FIX: controller এখানেই register করা হচ্ছে
    // binding না থাকলেও কাজ করবে
    if (!Get.isRegistered<NavController>()) {
      Get.put(NavController(), permanent: false);
    }
  }

  NavController get controller => Get.put<NavController>(NavController());

  final List<Widget> _pages = const [
    HRMSDashboard(), // 0 — Home
    ApprovalView(),  // 1 — Approval
    RobiulPage(),    // 2 — Attendance (FAB)
    ArafatView(),    // 3 — Payroll
    TestView(),      // 4 — Profile
  ];

  static const _kRed     = Color(0xFFFF3B30);
  static const _kRedDark = Color(0xFFE0241B);
  static const _kGrey    = Color(0xFF9E9E9E);
  static const _kDark1   = Color(0xFF1E1E24);
  static const _kDark2   = Color(0xFF2D2D3A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      resizeToAvoidBottomInset: false,

      // ── Body ────────────────────────────────────────────
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: _pages,
        ),
      ),

      // ── FAB ─────────────────────────────────────────────
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        final isSel = controller.currentIndex.value == 2;
        return GestureDetector(
          onTap: () => controller.changePage(2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            height: 62,
            width: 62,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isSel
                    ? [_kDark1, _kDark2]
                    : [_kRed, _kRedDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: isSel
                      ? Colors.black.withOpacity(0.22)
                      : _kRed.withOpacity(0.40),
                  blurRadius: 14,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    isSel ? Icons.shield_rounded : Icons.shield_outlined,
                    key: ValueKey(isSel),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'IN/OUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
        );
      }),

      // ── Bottom Nav ───────────────────────────────────────
      bottomNavigationBar: BottomAppBar(
        elevation: 18,
        shadowColor: Colors.black.withOpacity(0.30),
        color: Colors.white,
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 64,
          child: Obx(
            () => Row(
              children: [
                _navItem(0, Icons.grid_view_rounded,      Icons.grid_view_rounded,     'Home'),
                _navItem(1, Icons.near_me_outlined,       Icons.near_me_rounded,       'Approval'),
                const SizedBox(width: 62),
                _navItem(3, Icons.credit_card_outlined,   Icons.credit_card_rounded,   'Payroll'),
                _navItem(4, Icons.person_outline_rounded, Icons.person_rounded,        'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSel = controller.currentIndex.value == index;
    final color = isSel ? _kRed : _kGrey;

    return Expanded(
      child: InkWell(
        onTap: () => controller.changePage(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Icon(
                isSel ? activeIcon : icon,
                key: ValueKey('nav_${index}_$isSel'),
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSel ? FontWeight.w700 : FontWeight.w400,
              ),
              child: Text(label),
            ),
            const SizedBox(height: 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              height: 3,
              width: isSel ? 18 : 0,
              decoration: BoxDecoration(
                color: _kRed,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
