import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app/app_state_controlller.dart';
import '../../domain/models/country.dart';
import '../../domain/repositories/api_repository.dart';

class CountriesController extends GetxController {
  final ApiRepository repository;

  CountriesController({required this.repository});

  late String accessToken;
  final appStateCtrl = Get.find<AppStateController>();

  final allCountries = RxList<Country>();
  final filteredCountries = RxList<Country>();
  final _isLoading = false.obs;
  final _hasError = false.obs;
  final _errorMessage = "".obs;

  set isLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  set hasError(bool value) => _hasError.value = value;
  bool get hasError => _hasError.value;

  set errorMessage(String value) => _errorMessage.value = value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    accessToken = appStateCtrl.accessToken;
    super.onInit();
  }

  @override
  void onReady() async {
    await getCountries();
    super.onReady();
  }

  Future<void> getCountries() async {
    isLoading = true;
    hasError = false;
    try {
      final countries = await repository.getCountries(token: accessToken);
      allCountries.value = countries;
      filteredCountries.value = countries;
      isLoading = false;
      hasError = false;
      update();
    } catch (e) {
      isLoading = false;
      hasError = true;
      errorMessage = e.toString();
      debugPrint(e.toString());
    }
  }

  void search(String? query) {
    if (query != null) {
      final q = query.toLowerCase();
      filteredCountries.value =
          allCountries.where((c) => c.name.toLowerCase().contains(q)).toList();
      update();
    }
  }

  openMaps(String country) async {
    if (GetPlatform.isIOS) {
      return launchUrlString("https://maps.apple.com/?q=$country");
    }
    if (GetPlatform.isAndroid || GetPlatform.isWeb) {
      return launchUrlString(
          "https://www.google.com/maps/search/?api=1&query=$country");
    }
  }
}
