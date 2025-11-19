import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/topAnime_controller.dart';

class TopanimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopanimeController(), fenix: true);
  }
}
