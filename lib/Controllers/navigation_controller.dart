import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/topAnime_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/tvMaze_page.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pages = [
    () => TopanimePage(),
    () => TvmazePage(),
    () => FavoritePage(),
    () => ProfilePage(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
