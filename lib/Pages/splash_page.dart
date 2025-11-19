import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Components/custom_color.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final splash = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColor.background);
  }
}
