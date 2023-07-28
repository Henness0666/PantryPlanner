import 'package:flutter/material.dart';
import 'base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Pantry Planner',
      body: Center(
        child: Text(
          'Home/Dashboard content goes here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
