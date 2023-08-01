import 'package:flutter/material.dart';
import '../Widgets/base_screen.dart';
import '/Data Models/food_item.dart';

class PantryScreen extends StatelessWidget {
  // Sample data for pantry stats
  final int totalItems = 150;
  final int lowStockItems = 10;
  final int expiringSoonItems = 5;

  const PantryScreen({Key? key}) : super(key: key);

  get dbHelper => null;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Pantry',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pantry content goes here',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
                height:
                    20), // To provide some space between the Text and the Button
            ElevatedButton(
              onPressed: () async {
                // Example of adding a new food item to the database
                final newFoodItem = FoodItem(
                  name: 'Milk',
                  quantity: 1,
                  expiryDate: DateTime.now().add(const Duration(days: 7)),
                  id: 0,
                );
                int insertedId = await dbHelper.insertFoodItem(newFoodItem);

                // Example of getting all food items from the database
                List<FoodItem> allFoodItems = await dbHelper.getAllFoodItems();
                for (var foodItem in allFoodItems) {
                  print(
                      'Food Item: ${foodItem.name}, Expiry Date: ${foodItem.expiryDate}');
                }

                // Example of updating a food item in the database
                final updatedFoodItem = FoodItem(
                  id: insertedId,
                  name: 'Milk',
                  quantity: 2,
                  expiryDate: DateTime.now().add(const Duration(days: 14)),
                );
                await dbHelper.updateFoodItem(updatedFoodItem);

                // Example of deleting a food item from the database
                await dbHelper.deleteFoodItem(insertedId);

                // Close the database when it's no longer needed
                dbHelper.closeDatabase();
              },
              child: const Text('Perform Database Operations'),
            ),
          ],
        ),
      ),
    );
  }
}
