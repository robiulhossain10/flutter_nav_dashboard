import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
import 'package:new_system_flutter/app/dashboard/views/fab_menu_view.dart';

// import '../controller/navbar_controller.dart';
// import '../model/nav_item_model.dart';
// import '../../../../app/theme/app_colors.dart';
// import 'fab_menu_view.dart';

class BottomNavbarView extends GetView<NavbarController> {
  const BottomNavbarView({super.key});

  static const _kRed = Color(0xFFC0392B);
  static const _kGrey = Color(0xFFC8C8C8);
  static const _kNavHeight = 72.0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          // ── FAB Menu overlay ──────────────────────────────
          if (controller.isFabMenuOpen.value)
            GestureDetector(
              onTap: controller.closeFabMenu,
              child: Container(
                color: Colors.black.withOpacity(0.45),
                width: double.infinity,
                height: double.infinity,
              ),
            ),

          // ── FAB Menu popup ────────────────────────────────
          if (controller.isFabMenuOpen.value)
            Positioned(
              bottom: _kNavHeight + 10,
              left: 16,
              right: 16,
              child: FabMenuView(controller: controller),
            ),

          // ── Bottom Navbar ─────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: _kNavHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: List.generate(
                  controller.navItems.length,
                  (index) => index == 2 ? _buildFab() : _buildNavItem(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Regular nav item ──────────────────────────────────────
  Widget _buildNavItem(int index) {
    final item = controller.navItems[index];
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.onNavTap(index),
        behavior: HitTestBehavior.opaque,
        child: Obx(() {
          final active = controller.isActive(index);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 6),
              Icon(
                active ? item.activeIcon : item.icon,
                size: 24,
                color: active ? _kRed : _kGrey,
              ),
              const SizedBox(height: 4),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: active ? _kRed : _kGrey,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: active ? 20 : 0,
                height: 3,
                decoration: BoxDecoration(
                  color: _kRed,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // ── FAB center button ─────────────────────────────────────
  Widget _buildFab() {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.onNavTap(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => RotationTransition(
                turns: controller.fabRotateAnim,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFC0392B), Color(0xFF96281B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFC0392B).withOpacity(
                          controller.isFabMenuOpen.value ? 0.6 : 0.4,
                        ),
                        blurRadius: controller.isFabMenuOpen.value ? 24 : 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(
                    controller.isFabMenuOpen.value
                        ? Icons.close_rounded
                        : Icons.apps_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Obx(
              () => Text(
                controller.isFabMenuOpen.value ? 'Close' : 'Menu',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFC0392B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
