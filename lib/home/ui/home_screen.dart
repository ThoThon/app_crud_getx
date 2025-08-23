import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.logout();
            Get.offAllNamed(Routes.login);
          },
          child: const Text("Đăng xuất"),
        ),
      ),
    );
  }
}
