import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_22/Models/registerAPI_model.dart';
import 'package:pas_mobile_11pplg2_22/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterAPIController extends GetxController {
  // --- Text Controllers ---
  final inpUsername = TextEditingController();
  final inpPassword = TextEditingController();
  final inpFullName = TextEditingController();
  final inpEmail = TextEditingController();

  final isLoading = false.obs;
  static const String baseURL = 'mediadwi.com';

  // Menyimpan token (dari SharedPreferences)
  RxString token = ''.obs;

  Future<void> registerLogic() async {
    final user = inpUsername.text.trim();
    final pass = inpPassword.text.trim();
    final fullName = inpFullName.text.trim();
    final email = inpEmail.text.trim();

    if (user.isEmpty || pass.isEmpty || fullName.isEmpty || email.isEmpty) {
      Get.snackbar(
        'Error',
        'Mohon isi semua field',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;

    final url = Uri.https(baseURL, '/api/latihan/register-user');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': user,
          'password': pass,
          'full_name': fullName,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final registerData = RegisterApiModel.fromJson(jsonData);

        Get.snackbar(
          'REGISTER STATUS',
          registerData.message,
          snackPosition: SnackPosition.TOP,
        );

        if (registerData.status == true) {
          final prefs = await SharedPreferences.getInstance();

          // Simpan data pendaftaran
          await prefs.setString('username', user);
          await prefs.setString('user_password', pass);
          await prefs.setString('full_name', fullName);
          await prefs.setString('email', email);
          inpUsername.clear();
          inpPassword.clear();
          inpFullName.clear();
          inpEmail.clear();

          Get.offAllNamed(AppRoutes.LoginPage);
        }
      } else {
        Get.snackbar(
          'Error',
          'Gagal register: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
