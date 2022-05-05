import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: const [
        Text(
          "404",
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          "Page not found",
          style: TextStyle(fontSize: 24.0),
        )
      ],
    ));
  }
}
