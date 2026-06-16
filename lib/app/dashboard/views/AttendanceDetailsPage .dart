import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_photos.dart';

class AttendanceDetailsPage extends StatelessWidget {
  const AttendanceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserPhotos user = Get.arguments;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        backgroundColor: Colors.grey[100],

        appBar: AppBar(
          title: const Text("Attendance Details"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.deepPurple,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                // 🔥 HEADER CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                    ),

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        user.employeeName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        user.employeeCode,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔥 DETAILS CARDS
                _infoCard(
                  icon: Icons.badge,
                  title: "Employee ID",
                  value: user.employeeId.toString(),
                ),

                _infoCard(
                  icon: Icons.person,
                  title: "Employee Name",
                  value: user.employeeName,
                ),

                _infoCard(
                  icon: Icons.code,
                  title: "Employee Code",
                  value: user.employeeCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(icon, color: Colors.deepPurple),
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
