import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:new_system_flutter/app/routes/app_routes.dart';

class HRMSDashboard extends StatelessWidget {
  const HRMSDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ইউজার প্রোফাইল কার্ড
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: Colors.blueAccent),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome back,",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ID: EMP-2026",
                      style: TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54, // টেক্সট কালারটি একটু স্পষ্ট করা হলো
            ),
          ),
          const SizedBox(height: 12),

          // ড্যাশবোর্ড গ্রিড মেনু
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              // ১. Check In/Out
              _buildMenuCard(
                Icons.fingerprint,
                "Check In/Out",
                Colors.green,
                () {
                  Get.toNamed(AppRoutes.splash);
                },
              ),

              // ২. Leave Request (সরাসরি রুট ধরে কল করা হলো যেন লুপ না হয়)
              _buildMenuCard(
                Icons.calendar_today,
                "Leave Request",
                Colors.orange,
                () {
                  Get.toNamed(
                    AppRoutes.splash,
                  ); // MainScreen এর ইনডেক্স ২-এর সাথে মিল রেখে
                },
              ),

              // ৩. Payslip
              _buildMenuCard(Icons.receipt_long, "Payslip", Colors.purple, () {
                Get.toNamed(AppRoutes.profile);
              }),

              // ৪. Task List
              _buildMenuCard(
                Icons.assignment_late,
                "Task List",
                Colors.blue,
                () {
                  Get.toNamed(AppRoutes.users);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // মেনু কার্ড বানানোর জন্য হেল্পার ফাংশন
  Widget _buildMenuCard(
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
