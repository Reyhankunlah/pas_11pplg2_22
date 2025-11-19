import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    checkLogin();
    super.onInit();
  }

  checkLogin() async {
    await Future.delayed(Duration(milliseconds: 5700));

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      Get.offAllNamed(AppRoutes.btmNav);
    } else {
      Get.offAllNamed(AppRoutes.LoginPage);
    }
  }
}
