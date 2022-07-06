import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:prueba/src/presentation/countries/countries_binding.dart';
import 'package:prueba/src/presentation/countries/countries_page.dart';
import 'package:prueba/src/presentation/splash/splash_binding.dart';
import 'package:prueba/src/presentation/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.countries,
      page: () => const CountriesPage(),
      binding: CountriesBinding(),
    ),
  ];
}
