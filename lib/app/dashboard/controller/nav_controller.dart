import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/models/nav_model.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

// import '../model/nav_item_model.dart';
// import '../../../app/routes/app_routes.dart';
// import '../../../core/storage/local_storage.dart';

class NavbarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ── State ──────────────────────────────────────────────
  final currentIndex = 0.obs;
  final isFabMenuOpen = false.obs;

  late AnimationController fabAnimController;
  late Animation<double> fabScaleAnim;
  late Animation<double> fabRotateAnim;

  // ── User role (from storage) ────────────────────────────
  // final _storage = Get.find<LocalStorage>();
  // String get userRole => _storage.userRole ?? 'employee';
  final userRole = 'employee'; // placeholder — replace with storage

  // ── Bottom Nav Items ────────────────────────────────────
  final List<NavItemModel> navItems = const [
    NavItemModel(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      route: AppRoutes.home,
    ),
    NavItemModel(
      label: 'Attendance',
      icon: Icons.shield_outlined,
      activeIcon: Icons.shield_rounded,
      route: AppRoutes.stack,
    ),
    NavItemModel(
      label: '', // FAB placeholder
      icon: Icons.apps_rounded,
      activeIcon: Icons.apps_rounded,
      route: '',
    ),
    NavItemModel(
      label: 'Leave',
      icon: Icons.calendar_today_outlined,
      activeIcon: Icons.calendar_month_rounded,
      route: AppRoutes.newpractice,
    ),
    NavItemModel(
      label: 'Profile',
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
      route: AppRoutes.profile,
    ),
  ];

  // ── FAB Menu Items ──────────────────────────────────────
  final List<FabMenuItemModel> _allFabItems = const [
    FabMenuItemModel(
      label: 'Payslip',
      icon: Icons.receipt_long_rounded,
      color: Color(0xFFE67E22),
      bgColor: Color(0xFFFEF5E7),
      route: AppRoutes.profile,
      allowedRoles: ['all'],
    ),
    FabMenuItemModel(
      label: 'Notices',
      icon: Icons.campaign_rounded,
      color: Color(0xFF1A6FBF),
      bgColor: Color(0xFFEBF3FB),
      route: AppRoutes.splash,
      allowedRoles: ['all'],
    ),
    FabMenuItemModel(
      label: 'Approval',
      icon: Icons.task_alt_rounded,
      color: Color(0xFF27AE60),
      bgColor: Color(0xFFE8F5EE),
      route: AppRoutes.newpractice,
      allowedRoles: ['supervisor', 'hr', 'admin'],
    ),
    FabMenuItemModel(
      label: 'Directory',
      icon: Icons.people_alt_rounded,
      color: Color(0xFF8E44AD),
      bgColor: Color(0xFFF3EEFF),
      route: AppRoutes.details,
      allowedRoles: ['all'],
    ),
    FabMenuItemModel(
      label: 'Documents',
      icon: Icons.folder_rounded,
      color: Color(0xFFC0392B),
      bgColor: Color(0xFFFDECEA),
      route: AppRoutes.slider,
      allowedRoles: ['all'],
    ),
    FabMenuItemModel(
      label: 'ID Card',
      icon: Icons.badge_rounded,
      color: Color(0xFF1E7A45),
      bgColor: Color(0xFFE8F5EE),
      route: AppRoutes.hospital,
      allowedRoles: ['all'],
    ),
    FabMenuItemModel(
      label: 'Reports',
      icon: Icons.bar_chart_rounded,
      color: Color(0xFF0D4F8C),
      bgColor: Color(0xFFDEEAF7),
      route: AppRoutes.hospital,
      allowedRoles: ['supervisor', 'hr', 'admin'],
    ),
  ];

  // filtered by role
  List<FabMenuItemModel> get fabItems => _allFabItems
      .where(
        (item) =>
            item.allowedRoles.contains('all') ||
            item.allowedRoles.contains(userRole),
      )
      .toList();

  // ── Lifecycle ───────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    fabAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    fabScaleAnim = CurvedAnimation(
      parent: fabAnimController,
      curve: Curves.easeOutBack,
    );
    fabRotateAnim = Tween<double>(begin: 0, end: 0.125).animate(
      CurvedAnimation(parent: fabAnimController, curve: Curves.easeInOut),
    );
  }

  @override
  void onClose() {
    fabAnimController.dispose();
    super.onClose();
  }

  // ── Methods ─────────────────────────────────────────────
  void onNavTap(int index) {
    if (index == 2) {
      toggleFabMenu(); // center = FAB
      return;
    }
    closeFabMenu();
    currentIndex.value = index;
    Get.offAllNamed(navItems[index].route);
  }

  void toggleFabMenu() {
    if (isFabMenuOpen.value) {
      closeFabMenu();
    } else {
      openFabMenu();
    }
  }

  void openFabMenu() {
    isFabMenuOpen.value = true;
    fabAnimController.forward();
  }

  void closeFabMenu() {
    isFabMenuOpen.value = false;
    fabAnimController.reverse();
  }

  void onFabItemTap(FabMenuItemModel item) {
    closeFabMenu();
    Get.toNamed(item.route);
  }

  bool isActive(int index) => currentIndex.value == index;
}
