import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/loginAPI_controller.dart';

class LoginAPIbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginapiController(), permanent: true);
  }
}
