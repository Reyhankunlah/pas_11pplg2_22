import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_button.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_header.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/registerAPI_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final register = Get.find<RegisterAPIController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          // Background
          BackDecoration(),

          // Header
          CustomHeader(judulHeader: "Register"),

          // Form Section
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Username
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: register.inpUsername,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Full Name
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: register.inpFullName,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Email
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: register.inpEmail,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                Container(
                  decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: register.inpPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Button Register
                Obx(() {
                  return CustomButton(
                    myText: register.isLoading.value
                        ? "Processing..."
                        : "REGISTER",
                    textColor: CustomColor.black,
                    isOutlined: true,
                    onPressed: () {
                      if (!register.isLoading.value) {
                        register.registerLogic();
                      }
                    },
                  );
                }),

                const SizedBox(height: 16),

                // Move to Login
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Center(
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        color: CustomColor.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
