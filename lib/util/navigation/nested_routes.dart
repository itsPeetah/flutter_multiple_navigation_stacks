import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/404.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/hello.dart';

class NestedNavigatorRoutes {
  static const String root = "/";
  static const String home = "/home";
  static const String map = "/map";
  static const String cart = "/cart";
  static const String profile = "/profile";
  static const String product = "/product";
}

class HomeNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NestedNavigatorRoutes.root:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Home"),
        );
      default:
        return NestedNavigatorRouter.generateRoute(settings);
    }
  }
}

class MapNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NestedNavigatorRoutes.root:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Map"),
        );
      default:
        return NestedNavigatorRouter.generateRoute(settings);
    }
  }
}

class CartNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NestedNavigatorRoutes.root:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Cart"),
        );
      default:
        return NestedNavigatorRouter.generateRoute(settings);
    }
  }
}

class ProfileNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NestedNavigatorRoutes.root:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Profile"),
        );
      default:
        return NestedNavigatorRouter.generateRoute(settings);
    }
  }
}

class NestedNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NestedNavigatorRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Home"),
        );
      case NestedNavigatorRoutes.map:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Map"),
        );
      case NestedNavigatorRoutes.cart:
        return MaterialPageRoute(
          builder: (_) => const HelloPage(title: "Cart"),
        );
      case NestedNavigatorRoutes.profile:
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
