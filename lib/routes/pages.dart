import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/favorite_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/loginAPI_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/navigations_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/profile_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/registerAPI_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/topAnime_binding.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/tvMazeAPI_binding.dart';
import 'package:pas_mobile_11pplg2_22/Controllers/navigation_controller.dart';
import 'package:pas_mobile_11pplg2_22/Pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/login_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/nav/btmNav_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/register_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/splash_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/topAnime_page.dart';
import 'package:pas_mobile_11pplg2_22/Pages/tvMaze_page.dart';
import 'package:pas_mobile_11pplg2_22/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LoginPage,
      page: () => LoginPage(),
      binding: LoginAPIbinding(),
    ),
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.btmNav,
      page: () => BtmnavPage(),
      bindings: [NavigationBinding(), TopanimeBinding(), ProfileBinding()],
    ),
    GetPage(
      name: AppRoutes.topAnimePage,
      page: () => TopanimePage(),
      binding: TopanimeBinding(),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
      binding: RegisterAPIBinding(),
    ),
    GetPage(
      name: AppRoutes.tvMazePage,
      page: () => TvmazePage(),
      bindings: [TvmazeapiBinding(), FavoriteBinding()],
    ),
    GetPage(
      name: AppRoutes.tvMazePage,
      page: () => TvmazePage(),
      bindings: [TvmazeapiBinding(), FavoriteBinding()],
    ),
    GetPage(
      name: AppRoutes.favoritePage,
      page: () => FavoritePage(),
      bindings: [TvmazeapiBinding(), FavoriteBinding()],
    ),
  ];
}
