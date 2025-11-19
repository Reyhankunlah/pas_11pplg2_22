import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController(), permanent: true);
  }
}
