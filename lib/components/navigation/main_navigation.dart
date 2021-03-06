import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/bottom_tab_bar.dart';
import 'package:flutter_multiple_navigation_stacks_1/components/navigation/nested_navigator.dart';
import 'package:flutter_multiple_navigation_stacks_1/util/navigation/nested_routes.dart';
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
      /*
        Clicking the tab item again will bring back to "/".
        Should not use a single class for the router, make four different ones
       */
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
        _setCurrentTab(tabItem);
      });
    }
  }

  void _setCurrentTab(TabItem tabItem) {
    _currentTab = tabItem;
  }

  String _getAppBarTitle() {
    return _currentTab.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
      ),
      body: PageView(
        onPageChanged: (idx) => setState(() {
          _setCurrentTab(TabItem.values[idx]);
        }),
        controller: _pageController,
        children: [
          _buildNavigator(TabItem.home),
          _buildNavigator(TabItem.map),
          _buildNavigator(TabItem.cart),
          _buildNavigator(TabItem.profile),
        ],
      ),
      bottomNavigationBar: BottomTabBar(
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
          initialRoute: NestedNavigatorRoutes.root,
          onGenerateRoute: NestedNavigatorRouter.generateHomeRoute,
        );
      case TabItem.map:
        return NestedNavigator(
          navigatorKey: _mapNavigatorKey,
          initialRoute: NestedNavigatorRoutes.root,
          onGenerateRoute: NestedNavigatorRouter.generateMapRoute,
        );
      case TabItem.cart:
        return NestedNavigator(
          navigatorKey: _cartNavigatorKey,
          initialRoute: NestedNavigatorRoutes.root,
          onGenerateRoute: NestedNavigatorRouter.generateCartRoute,
        );
      case TabItem.profile:
        return NestedNavigator(
          navigatorKey: _profileNavigatorKey,
          initialRoute: NestedNavigatorRoutes.root,
          onGenerateRoute: NestedNavigatorRouter.generateProfileRoute,
        );
    }
  }
}
