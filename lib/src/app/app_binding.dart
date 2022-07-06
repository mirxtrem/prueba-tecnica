import 'package:get/get.dart';

import 'app_state_controlller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppStateController>(
      AppStateController(),
      permanent: true,
    );
  }
}
