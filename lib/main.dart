import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/util/navigation/main_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nested Navigation Tests',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      /* Entry Point -> MainNavigation (tabbed view) */
      initialRoute: MainNavigationRoutes.root,
      /* Here to create pages based on route */
      onGenerateRoute: MainNavigatorRouter.generateRoute,
    );
  }
}
