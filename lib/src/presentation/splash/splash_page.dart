import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.map_outlined,
                color: Colors.orange,
                size: 80,
              ),
              const Text(
                'Countries Maps',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator.adaptive()
                  : ElevatedButton(
                      onPressed: controller.start,
                      child: const Text(
                        'Bienvenido',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
