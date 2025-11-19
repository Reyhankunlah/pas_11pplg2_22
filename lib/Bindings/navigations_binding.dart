import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/navigation_controller.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/profile_controller.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/topAnime_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);

    Get.lazyPut(() => TopanimeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
