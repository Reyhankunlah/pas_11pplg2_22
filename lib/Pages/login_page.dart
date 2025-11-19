import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_button.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_text.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_textField.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/loginAPI_controller.dart';
import 'package:pas_mobile_11pplg2_22/routes/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final cLogPage = Get.find<LoginapiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            BackDecoration(),

            /// Bungkus dengan scroll agar tidak overflow
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    /// HEADER
                    Column(
                      children: [
                        CustomText(
                          myText: 'FLUTTER',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontColor: CustomColor.bluePrimary,
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                          myText: 'Welcome Back!',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontColor: CustomColor.bluePrimary,
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    /// FORM FIELD
                    CustomTextField(
                      label: "Username",
                      controller: cLogPage.inpUsername,
                      isNumber: false,
                      borderColor: CustomColor.bluePrimary,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: "Password",
                      controller: cLogPage.inpPassword,
                      isPassword: true,
                      isNumber: false,
                      borderColor: CustomColor.bluePrimary,
                    ),

                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: CustomText(
                          myText: 'Forgot your password?',
                          fontColor: CustomColor.blueSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// BUTTON LOGIN → TANPA Obx karena tidak pakai Rx
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: CustomButton(
                        myText: "LOGIN",
                        textColor: CustomColor.black,
                        onPressed: () => cLogPage.loginLogic(),

                        isOutlined: true,
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.registerPage);
                      },
                      child: const CustomText(
                        myText: 'Create new account',
                        fontColor: CustomColor.elementInactive1,
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
