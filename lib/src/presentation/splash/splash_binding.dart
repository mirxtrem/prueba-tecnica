import 'package:get/get.dart';
import 'package:prueba/src/data/services/api_service.dart';
import 'package:prueba/src/domain/repositories/api_repository.dart';

import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(
          repository: ApiRepository(api: ApiService()),
        ));
  }
}
