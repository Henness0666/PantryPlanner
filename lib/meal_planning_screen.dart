import 'package:flutter/material.dart';

class MealPlanningScreen extends StatelessWidget {
  const MealPlanningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planning'),
      ),
      body: const Center(
        child: Text(
          'This is the Meal Planning screen. Implement your meal planning features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
