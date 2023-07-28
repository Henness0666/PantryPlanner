import 'package:flutter/material.dart';
import 'base_screen.dart';

class MealPlanningScreen extends StatelessWidget {
  const MealPlanningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Meal Planning',
      body: Center(
        child: Text(
          'This is the Meal Planning screen. Implement your meal planning features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
