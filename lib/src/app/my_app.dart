import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/src/app/app_binding.dart';
import 'package:prueba/src/app/routes/app_pages.dart';
import 'package:prueba/src/app/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppTheme.light,
    );
  }
}
