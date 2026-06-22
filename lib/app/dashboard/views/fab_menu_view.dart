
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_system_flutter/app/dashboard/controller/nav_controller.dart';
// import 'package:new_system_flutter/app/dashboard/models/nav_model.dart';

// // import '../controller/navbar_controller.dart';
// // import '../model/nav_item_model.dart';

// class FabMenuView extends StatelessWidget {
//   final NavbarController controller;
//   const FabMenuView({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: controller.fabScaleAnim,
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               blurRadius: 30,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // ── Header ─────────────────────────────────
//             Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 4, height: 16,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFC0392B),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     'Quick Access',
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFF1a1a1a),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ── Grid ───────────────────────────────────
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 14,
//                 childAspectRatio: 0.85,
//               ),
//               itemCount: controller.fabItems.length,
//               itemBuilder: (context, index) {
//                 final item = controller.fabItems[index];
//                 return _buildMenuItem(item);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem(FabMenuItemModel item) {
//     return GestureDetector(
//       onTap: () => controller.onFabItemTap(item),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 52, height: 52,
//             decoration: BoxDecoration(
//               color: item.bgColor,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: item.color.withOpacity(0.15),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Icon(item.icon, color: item.color, size: 24),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             item.label,
//             style: const TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF555555),
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
