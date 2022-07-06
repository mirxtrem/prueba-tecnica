import 'package:get/get.dart';

import '../domain/models/country.dart';

class AppStateController extends GetxController {
  final _accessToken = ''.obs;
  final allCountries = RxList<Country>();
  
  set accessToken(String value) => _accessToken.value = value;
  String get accessToken => _accessToken.value;


}
