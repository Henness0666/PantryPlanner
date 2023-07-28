import 'package:flutter/material.dart';
import 'base_screen.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Shopping List',
      body: Center(
        child: Text(
          'This is the Shopping List screen. Implement your shopping list features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
