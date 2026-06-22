import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:new_system_flutter/app/dashboard/bindings/hospital_binding.dart';
import 'package:new_system_flutter/app/dashboard/bindings/login_bindings.dart';
import 'package:new_system_flutter/app/dashboard/bindings/main_binding.dart';
import 'package:new_system_flutter/app/dashboard/bindings/splash_binding.dart';
import 'package:new_system_flutter/app/dashboard/bindings/user_binding.dart';
import 'package:new_system_flutter/app/dashboard/views/AttendanceDetailsPage%20.dart';
import 'package:new_system_flutter/app/dashboard/views/aproval_slider.dart';
import 'package:new_system_flutter/app/dashboard/views/arafat_view.dart';
import 'package:new_system_flutter/app/dashboard/views/hospital_details.dart';
import 'package:new_system_flutter/app/dashboard/views/hospital_view.dart';
import 'package:new_system_flutter/app/dashboard/views/login_view.dart';
import 'package:new_system_flutter/app/dashboard/views/main_screen.dart';
import 'package:new_system_flutter/app/dashboard/views/new_practice_view.dart';
import 'package:new_system_flutter/app/dashboard/views/profile_view.dart';
import 'package:new_system_flutter/app/dashboard/views/splash_screen.dart';
import 'package:new_system_flutter/app/dashboard/views/stack.dart';
import 'package:new_system_flutter/app/dashboard/views/user_page.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const BottomNavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: AppRoutes.details,
       page: () => const ArafatView()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilreView()),
    GetPage(name: AppRoutes.stack, page: () => const StackView()),
    GetPage(
      name: AppRoutes.users,
      page: () => UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: AppRoutes.usersDetails,
      page: () => const AttendanceDetailsPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: AppRoutes.hospital,
      page: () => HospitalView(),
      binding: HospitalBinding(),
    ),
    GetPage(
      name: AppRoutes.hospitalDetails,
      page: () => const HospitalDetails(),
      binding: HospitalBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.slider,
      page: () => const ApprovalView()
    ),
    GetPage(
      name: AppRoutes.newpractice,
      page: () => const NewPracticeView()
    ),
  ];
}
