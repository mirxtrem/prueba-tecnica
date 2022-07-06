part of "app_pages.dart";

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const home = _Paths.countries;
}

abstract class _Paths {
  static const splash = "/splash";
  static const countries = "/countries";
}
