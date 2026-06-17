import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/models/hospital.dart';

class HospitalDetails extends StatelessWidget {
  const HospitalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Hospital user = Get.arguments;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        backgroundColor: Colors.grey[100],

        appBar: AppBar(
          title: const Text(
            "Hospital Details",
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.vertical(
              bottom: Radius.circular(22),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.deepPurple,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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
                        user.patientName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        user.sampleId,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔥 DETAILS CARDS
                _infoCard(
                  icon: Icons.badge,
                  title: "ID",
                  value: user.id.toString(),
                ),

                _infoCard(
                  icon: Icons.person,
                  title: "Patient Name",
                  value: user.patientName,
                ),

                _infoCard(
                  icon: Icons.code,
                  title: "Sample ID",
                  value: user.sampleId,
                ),
                _infoCard(
                  icon: Icons.bloodtype,
                  title: "Test Code",
                  value: user.testCodes,
                ),
                _infoCard(
                  icon: Icons.signal_wifi_statusbar_4_bar_sharp,
                  title: "Status",
                  value: user.status,
                ),
                _infoCard(
                  icon: Icons.date_range,
                  title: "Date",
                  value: user.createdAt,
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
