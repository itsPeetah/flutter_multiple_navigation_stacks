import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/main_navigation.dart';

class MainNavigationRoutes {
  static const String root = "/";
}

// Generate routes for the main navigation
class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutes.root:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
    }
    return null;
  }
}

class TabNavigatorRoutes {
  static const String root = '/home';
  static const String detail = '/detail';
}
