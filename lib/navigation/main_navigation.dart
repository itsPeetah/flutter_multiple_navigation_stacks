import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/bottom_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/tab_item.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/hello.dart';

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

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      if (_currentTab == TabItem.home) {
        // pop to first route
        _homeNavigatorKey.currentState!.popUntil((route) => route.isFirst);
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
        children: const [
          HelloPage(title: "Home"),
          HelloPage(title: "Map"),
          HelloPage(title: "Cart"),
          HelloPage(title: "Profile"),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}
