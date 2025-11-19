import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/API/tvMazeAPI_controller.dart';

class TvmazeapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TvmazeapiController(), fenix: true);
  }
}
