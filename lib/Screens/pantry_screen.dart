import 'package:flutter/material.dart';

class PantryScreen extends StatelessWidget {
  const PantryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry'),
      ),
      body: const Center(
        child: Text(
          'This is the Pantry screen. Implement your pantry features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
