import 'dart:js';

import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text(
            "404",
            style: TextStyle(fontSize: 44),
          ),
          Text(
            "Invalid route",
            style: TextStyle(fontSize: 28),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
