import 'package:get/get.dart';

import '../../models/login/login_storage.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> logout() async {
    await LoginStorage.clearLoginInfo();
  }
}
