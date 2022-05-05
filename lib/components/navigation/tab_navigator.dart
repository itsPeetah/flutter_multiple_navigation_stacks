import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/hello.dart';
import 'package:flutter_multiple_navigation_stacks_1/util/navigation/navigation_routes.dart';
import 'package:flutter_multiple_navigation_stacks_1/util/navigation/tab_item.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                routeBuilders[TabNavigatorRoutes.detail]!(context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => HelloPage(
            title: "$tabItem",
          ),
      // TabNavigatorRoutes.root: (context) => ColorsListPage(
      //       color: TabHelper.color(tabItem),
      //       title: TabHelper.description(tabItem),
      //       onPush: (materialIndex) =>
      //           _push(context, materialIndex: materialIndex),
      //     ),
      //
      // TabNavigatorRoutes.detail: (context) => ColorDetailPage(
      //       color: TabHelper.color(tabItem),
      //       title: TabHelper.description(tabItem),
      //       materialIndex: materialIndex,
      //     ),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) =>
                  routeBuilders[routeSettings.name]!(context));
        });
  }
}
