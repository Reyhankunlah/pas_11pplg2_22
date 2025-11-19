import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/splash_controller.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/topAnime_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);

    Get.lazyPut(() => TopanimeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
