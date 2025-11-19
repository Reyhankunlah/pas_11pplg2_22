import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/backDecoration.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_button.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_header.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_profileCard.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/loginAPI_controller.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final profile = Get.find<ProfileController>();
  final auth = Get.find<LoginapiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: Stack(
        children: [
          BackDecoration(),
          CustomHeader(judulHeader: 'Profile'),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Obx(
                  () => CustomProfilecard(
                    name: profile.username.value,
                    kelas: profile.full_name.value,
                    absen: "11 PPLG 02 / 22",
                    email: profile.email.value,
                    imagePath: "lib/assets/Faiz.JPG",
                    backColor: CustomColor.white,
                  ),
                ),

                CustomButton(
                  myText: "LOGOUT",
                  textColor: CustomColor.black,
                  isOutlined: true,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content: const Text('Are you sure want to logout?'),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text('Logout'),
                              onPressed: () {
                                Navigator.pop(context);
                                auth.logout();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
