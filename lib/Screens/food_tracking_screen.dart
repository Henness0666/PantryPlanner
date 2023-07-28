import 'package:flutter/material.dart';

class FoodTrackingScreen extends StatelessWidget {
  const FoodTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Tracking'),
        // The leading property defines the widget to display before the toolbar's title.
        // It is often used to display a back button.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          'Food Tracking content goes here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
