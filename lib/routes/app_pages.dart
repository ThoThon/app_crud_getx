import 'package:flutter/material.dart';

import '../home/ui/home_screen.dart';
import '../login/ui/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    Routes.login: (context) => const LoginScreen(),
    Routes.home: (context) => const HomeScreen(),
  };
}
