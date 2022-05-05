import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/bottom_navigation.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/tab_item.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/tab_navigator.dart';
import 'package:flutter_multiple_navigation_stacks_1/pages/color_detail_page.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final navigatorKey = GlobalKey<NavigatorState>();
  TabItem currentTab = TabItem.red;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.red),
          _buildOffstageNavigator(TabItem.green),
          _buildOffstageNavigator(TabItem.blue),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      color: currentTab == TabItem.red
          ? Colors.red
          : currentTab == TabItem.blue
              ? Colors.blue
              : Colors.green,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onButtonPush,
        child: const Text(
          "Push",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }

  void onButtonPush() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ColorDetailPage(
            color: currentTab == TabItem.red
                ? Colors.red
                : currentTab == TabItem.blue
                    ? Colors.blue
                    : Colors.green,
            title: "Lol")));
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
