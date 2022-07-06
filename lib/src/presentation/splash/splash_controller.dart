import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba/src/app/app_state_controlller.dart';
import 'package:prueba/src/app/routes/app_pages.dart';
import 'package:prueba/src/domain/repositories/api_repository.dart';

class SplashController extends GetxController {
  final ApiRepository repository;
  SplashController({required this.repository});

  final isLoading = false.obs;
  final appStateCtrl = Get.find<AppStateController>();

  @override
  onReady() async {
    if (appStateCtrl.accessToken.isNotEmpty) {
      Get.toNamed(Routes.home);
    }
    super.onReady();
  }

  start() async {
    isLoading.value = true;
    try {
      final accessToken = await repository.getToken();
      appStateCtrl.accessToken = accessToken;
      isLoading.value = false;
      Get.toNamed(Routes.home);
    } catch (e) {
      Get.dialog(AlertDialog(
        title: const Text(
          "Lo sentimos",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(e.toString()),
      ));
    }
  }
}
