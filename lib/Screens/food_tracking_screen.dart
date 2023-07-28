import 'package:flutter/material.dart';

class FoodTrackingScreen extends StatelessWidget {
  const FoodTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Tracking'),
      ),
      body: const Center(
        child: Text(
          'This is the Food Tracking screen. Implement your food tracking features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
