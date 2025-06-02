import 'package:ai_image_generator/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String HOME_SCREEN = '/home';
}


class RouteConfig {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteName.HOME_SCREEN: (context) => const HomeScreen(),
  };
}