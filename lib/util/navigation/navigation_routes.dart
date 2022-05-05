import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/main_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/404.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/hello.dart';

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
      //case MainNavigationRoutes.root:
      default:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
    }
  }
}

class TabNavigatorRoutes {
  static const String home = "/home";
  static const String map = "/map";
  static const String cart = "/cart";
  static const String profile = "/profile";
  static const String product = "/product";
}

class TabNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TabNavigatorRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Home"),
        );
      case TabNavigatorRoutes.map:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Map"),
        );
      case TabNavigatorRoutes.cart:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Cart"),
        );
      case TabNavigatorRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Profile"),
        );
      case "/":
        return MaterialPageRoute(
            builder: (_) => const HelloPage(
                  title: "You shouldn't be here...",
                ));
      default:
        return MaterialPageRoute(builder: (_) => const PageNotFound());
    }
  }
}
