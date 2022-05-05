import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/main_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/fork.dart';

class MainNavigationRoutes {
  static const String root = "/";
}

class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutes.root:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
    }
    return null;
  }
}
