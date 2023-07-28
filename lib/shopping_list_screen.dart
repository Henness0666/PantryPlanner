import 'package:flutter/material.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: const Center(
        child: Text(
          'This is the Shopping List screen. Implement your shopping list features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
