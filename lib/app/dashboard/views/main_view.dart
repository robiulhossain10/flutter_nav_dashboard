// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
// import 'package:new_system_flutter/app/dashboard/views/arafat_view.dart';
// import 'package:new_system_flutter/app/dashboard/views/hospital_view.dart';
// import 'package:new_system_flutter/app/dashboard/views/hrms_dashboard.dart';
// import 'package:new_system_flutter/app/dashboard/views/main_screen.dart';
// import 'package:new_system_flutter/app/dashboard/views/new_practice_view.dart';
// import 'package:new_system_flutter/app/dashboard/views/user_page.dart';

// class MainView extends GetView<NavbarController> {
//   const MainView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Obx(() {
//             switch (controller.currentIndex.value) {
//               case 0:
//                 return const HRMSDashboard();
//               case 1:
//                 return const NewPracticeView();
//               case 3:
//                 return  UserPage();
//               case 4:
//                 return const ArafatView();
//               default:
//                 return const HospitalView();
//             }
//           }),
//           const Align(
//             alignment: Alignment.bottomCenter,
//             child: BottomNavbarView(),
//           ),
//         ],
//       ),
//     );
//   }
// }
