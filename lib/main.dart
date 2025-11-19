import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:pas_mobile_11pplg2_22/Bindings/init_binding.dart';
import 'package:pas_mobile_11pplg2_22/routes/pages.dart';
import 'package:pas_mobile_11pplg2_22/routes/routes.dart';

void main() {
  runApp(const MyApp());
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    print("FLUTTER ERROR: ${details.exception}");
    print("STACKTRACE:\n${details.stack}");
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.btmNav,
      initialBinding: InitBinding(),
      getPages: AppPages.pages,
    );
  }
}
