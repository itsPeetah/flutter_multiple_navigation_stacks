import 'package:flutter/material.dart';

class ForkPage extends StatelessWidget {
  const ForkPage({Key? key, required this.route1, required this.route2})
      : super(key: key);
  final String route1, route2;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        TextButton(
          onPressed: () => print(route1),
          child: Text("Go to $route1"),
        ),
        TextButton(
          onPressed: () => print(route2),
          child: Text("Go to $route2"),
        )
      ],
    ));
  }
}
