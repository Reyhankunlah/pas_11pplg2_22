import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
