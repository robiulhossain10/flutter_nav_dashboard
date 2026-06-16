import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

import '../controller/user_controller.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});


  final UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users"), centerTitle: true),

      body: Obx(() {
        /// 🔥 Loading state
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red, strokeWidth: 3),
          );
        }

        /// 🔥 Empty state
        if (controller.users.isEmpty) {
          return RefreshIndicator(
            onRefresh: controller.fetchUsers,
            child: ListView(
              children: const [
                SizedBox(height: 200),
                Center(child: Text("No Users Found")),
              ],
            ),
          );
        }

        /// 🔥 List with Swipe Refresh
        return RefreshIndicator(
          onRefresh: controller.fetchUsers,

          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),

            padding: const EdgeInsets.all(10),
            itemCount: controller.users.length,

            itemBuilder: (context, index) {
              final user = controller.users[index];

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 6),

                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.employeeId.toString()),
                  ),

                  title: Text(user.employeeName),
                  subtitle: Text(user.employeeCode),

                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                  onTap: () {
                    Get.toNamed(
                      AppRoutes.usersDetails,
                      arguments: user, // 🔥 send full object
                    );
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
