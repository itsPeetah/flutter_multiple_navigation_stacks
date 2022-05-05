import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigation_stacks_1/app.dart';
import 'package:flutter_multiple_navigation_stacks_1/navigation/navigation_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: NavigationRoutes.root,
      onGenerateRoute: MainNavigatorRouter.generateRoute,
    );
  }
}
