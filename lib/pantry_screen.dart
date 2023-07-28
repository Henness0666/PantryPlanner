import 'package:flutter/material.dart';
import 'base_screen.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Pantry',
      body: Center(
        child: Text(
          'This is the Pantry screen. Implement your pantry features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
