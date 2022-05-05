import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/bottom_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/nested_navigator.dart';
import 'package:flutter_multiple_navigation_stacks_1/util/navigation/navigation_routes.dart';
import 'package:flutter_multiple_navigation_stacks_1/util/navigation/tab_item.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  final _pageController = PageController(initialPage: 0);
  var _currentTab = TabItem.home;

  // Navigator key used for nested navigation in the home page
  final _homeNavigatorKey = GlobalKey<NavigatorState>();
  final _mapNavigatorKey = GlobalKey<NavigatorState>();
  final _cartNavigatorKey = GlobalKey<NavigatorState>();
  final _profileNavigatorKey = GlobalKey<NavigatorState>();

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      switch (tabItem) {
        case TabItem.home:
          _homeNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
        case TabItem.map:
          _mapNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
        case TabItem.cart:
          _cartNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
        case TabItem.profile:
          _profileNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          break;
      }
    } else {
      setState(() {
        _pageController.jumpToPage(tabItem.index);
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildNavigator(TabItem.home),
          _buildNavigator(TabItem.map),
          _buildNavigator(TabItem.cart),
          _buildNavigator(TabItem.profile),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }

  Widget _buildNavigator(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return NestedNavigator(
          navigatorKey: _homeNavigatorKey,
          initialRoute: TabNavigatorRoutes.home,
          onGenerateRoute: TabNavigatorRouter.generateRoute,
        );
      case TabItem.map:
        return NestedNavigator(
          navigatorKey: _mapNavigatorKey,
          initialRoute: TabNavigatorRoutes.map,
          onGenerateRoute: TabNavigatorRouter.generateRoute,
        );
      case TabItem.cart:
        return NestedNavigator(
          navigatorKey: _cartNavigatorKey,
          initialRoute: TabNavigatorRoutes.cart,
          onGenerateRoute: TabNavigatorRouter.generateRoute,
        );
      case TabItem.profile:
        return NestedNavigator(
          navigatorKey: _profileNavigatorKey,
          initialRoute: TabNavigatorRoutes.profile,
          onGenerateRoute: TabNavigatorRouter.generateRoute,
        );
    }
  }
}
