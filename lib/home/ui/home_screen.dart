import 'package:app_crud_getx/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

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
