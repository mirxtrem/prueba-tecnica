import 'package:get/get.dart';

class AppStateController extends GetxController {

  final _accessToken = ''.obs;
  set accessToken(String value) => _accessToken.value = value;
  String get accessToken => _accessToken.value;
  
}