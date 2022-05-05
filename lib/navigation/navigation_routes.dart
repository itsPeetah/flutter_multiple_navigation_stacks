import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/main_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/fork.dart';

class NavigationRoutes {
  static const String root = "/";
  static const String map = "/map";
  static const String cart = "/cart";
  static const String profile = "/profile";
  static const String product = "/product";
}

class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.root:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
      // case HomeNavigatorRoutes.report:
      //   return MaterialPageRoute(
      //     builder: (_) => ReportPage(),
      //     fullscreenDialog: true,
      //   );
    }
    return null;
  }
}
