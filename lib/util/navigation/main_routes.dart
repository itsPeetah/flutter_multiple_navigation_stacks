import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/main_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/404.dart';

class MainNavigationRoutes {
  static const String root = "/";
  static const String checkout = "/checkout";
  static const String payment = "/payment";
  static const String checkoutResult = "/checkoutResult";
  static const String signin = "/signin";
}

// Generate routes for the main navigation
class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /* Put here the cases for checkout, payment... */
      case MainNavigationRoutes.root:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
      default:
        return MaterialPageRoute(builder: (_) => const PageNotFound());
    }
  }
}
