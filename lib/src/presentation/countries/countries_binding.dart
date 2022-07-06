import 'package:get/get.dart';

import '../../data/services/api_service.dart';
import '../../domain/repositories/api_repository.dart';
import 'countries_controller.dart';

class CountriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountriesController>(
      () => CountriesController(
        repository: ApiRepository(
          api: ApiService(),
        ),
      ),
    );
  }
}
