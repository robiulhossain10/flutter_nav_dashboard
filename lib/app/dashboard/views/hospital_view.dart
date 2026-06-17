import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/hospital_conroller.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

// ignore: must_be_immutable
class HospitalView extends StatelessWidget {
  HospitalView({super.key});

  HospitalConroller controller = Get.find<HospitalConroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Users"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.00)),
        ),
      ),

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
                  leading: CircleAvatar(child: Text(user.id.toString())),

                  title: Text(user.patientName),
                  subtitle: Text(user.sampleId),

                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                  onTap: () {
                    Get.toNamed(
                      AppRoutes.hospitalDetails,
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
