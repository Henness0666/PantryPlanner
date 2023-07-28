import 'package:flutter/material.dart';
import 'base_screen.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Shopping List',
      // The leading property defines the widget to display before the toolbar's title.
      // It is often used to display a back button.
      body: Center(
        child: Text(
          'Shopping List content goes here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
