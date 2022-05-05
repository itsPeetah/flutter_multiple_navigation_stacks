import 'package:flutter/material.dart';

enum TabItem { red, green, blue, home, hello, profile }

const Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue',
  TabItem.home: 'home',
  TabItem.hello: 'hello',
  TabItem.profile: 'profile',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};

const Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.profile: Icons.person
};
