import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/registerAPI_controller.dart';

class RegisterAPIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterAPIController(), fenix: true);
  }
}
