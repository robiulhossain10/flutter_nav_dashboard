import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // Instantiate the controller using GetX
  final SplashController controller = Get.put(SplashController());

  final currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    // Vibrant red background color matching the screenshot
    const Color brandRed = Color(0xFFFF2A33);
    const Color brandGreen = Color(0xFF0DB905);

    return Scaffold(
      backgroundColor: brandRed,
      body: SafeArea(
        child: Stack(
          children: [
            // Center Content: Logo, Title, Subtitle, and Dots
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo Container (White circle with 'i')
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/ignitelogo.png',
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) {
                            return const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // App Title
                  Text(
                    controller.appData.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // App Subtitle
                  Text(
                    controller.appData.subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Three Dots Indicator
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(isActive: controller.currentIndex.value == 0),
                        const SizedBox(width: 8),
                        _buildDot(isActive: controller.currentIndex.value == 1),
                        const SizedBox(width: 8),
                        _buildDot(isActive: controller.currentIndex.value == 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Content: Powered by version
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  controller.appData.version,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to construct the dots
  Widget _buildDot({required bool isActive}) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 300),
      scale: isActive ? 1.3 : 1.0,
      curve: Curves.easeOutBack,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
