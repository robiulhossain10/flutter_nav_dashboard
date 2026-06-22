import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_system_flutter/app/dashboard/views/custom_textfield.dart';

import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              /// Header
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFF3B3B),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Rounded Logo
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
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

                    const SizedBox(height: 15),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Text(
                      "Sign in to ESS Portal",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              /// Form
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Employee ID"),

                    const SizedBox(height: 8),

                    CustomTextField(
                      controller: controller.employeeIdController,
                      hintText: "EMP-00123",
                    ),

                    const SizedBox(height: 15),

                    const Text("Password"),

                    const SizedBox(height: 8),

                    Obx(
                      () => CustomTextField(
                        controller: controller.passwordController,
                        hintText: "********",
                        obscureText: controller.obscureText.value,
                        suffixIcon: IconButton(
                          onPressed: controller.togglePassword,
                          icon: Icon(
                            controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF3B3B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.login,
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Center(
                      child: Text(
                        "Secured with JWT + OTP",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
