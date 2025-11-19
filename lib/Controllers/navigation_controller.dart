import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/topAnime_page.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  // Page generator (function)
  final pages = [
    () => TopanimePage(),
    () => TopanimePage(),
    () => ProfilePage(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
