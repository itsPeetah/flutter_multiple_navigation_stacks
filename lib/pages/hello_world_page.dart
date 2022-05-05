import 'package:flutter/material.dart';

class HelloWorldPage extends StatelessWidget {
  HelloWorldPage({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}
