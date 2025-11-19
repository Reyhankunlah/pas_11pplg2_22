import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var full_name = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? '';
    email.value = prefs.getString('email') ?? '';
    full_name.value = prefs.getString('full_name') ?? '';
  }
}
