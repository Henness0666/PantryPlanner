import 'package:flutter/material.dart';
import 'food_tracking_screen.dart';
import 'pantry_screen.dart';
import 'nutrition_analysis_screen.dart';
import '/Data Models/food_item.dart';

class HomeScreen extends StatelessWidget {
  // Sample data for pantry stats
  final int totalItems = 150;
  final int lowStockItems = 10;
  final int expiringSoonItems = 5;

  const HomeScreen({Key? key}) : super(key: key);

  get dbHelper => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry Planner'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('Food Tracking'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodTrackingScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.kitchen),
              title: const Text('Pantry Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PantryScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Nutrition Analysis'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NutritionAnalysisScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
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
      ),
    );
  }
}
