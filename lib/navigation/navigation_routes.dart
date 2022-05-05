import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/404.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/hello_world_page.dart';

class MainNavigatorRoutes {
  static const String root = "/";
  static const String hello = "/hello";
}

class MainNavigatorRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigatorRoutes.root:
        return MaterialPageRoute(
            builder: (_) => HelloWorldPage(title: "Home page"));
      case MainNavigatorRoutes.hello:
        return MaterialPageRoute(
            builder: (_) => HelloWorldPage(title: "Hello world"));
    }
    return MaterialPageRoute(builder: (_) => PageNotFound());
  }
}
