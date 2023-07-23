import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'Data Models/food_item.dart';
import 'database.dart';

void main() {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  final db = openDatabase('0');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Sample data for pantry stats
  final int totalItems = 150;
  final int lowStockItems = 10;
  final int expiringSoonItems = 5;
  
  get dbHelper => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry Planner'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Food Tracking'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodTrackingScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.kitchen),
              title: Text('Pantry Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantryManagementScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Nutrition Analysis'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NutritionAnalysisScreen()),
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
              expiryDate: DateTime.now().add(const Duration(days: 7)), id: 0,
            );
            int insertedId = await dbHelper.insertFoodItem(newFoodItem);

            // Example of getting all food items from the database
            List<FoodItem> allFoodItems = await dbHelper.getAllFoodItems();
            allFoodItems.forEach((foodItem) {
              print('Food Item: ${foodItem.name}, Expiry Date: ${foodItem.expiryDate}');
            });

            // Example of updating a food item in the database
            final updatedFoodItem = FoodItem(
              id: insertedId,
              name: 'Milk',
              quantity: 2,
              expiryDate: DateTime.now().add(Duration(days: 14)),
            );
            await dbHelper.updateFoodItem(updatedFoodItem);

            // Example of deleting a food item from the database
            await dbHelper.deleteFoodItem(insertedId);

            // Close the database when it's no longer needed
            dbHelper.closeDatabase();
          },
          child: Text('Perform Database Operations'),
        ),
      ),
    );
  }
}

// Placeholder screens for Food Tracking, Pantry Management, and Nutrition Analysis
class FoodTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Tracking'),
      ),
      body: Center(
        child: Text(
          'This is the Food Tracking screen. Implement your food tracking features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class PantryManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry Management'),
      ),
      body: Center(
        child: Text(
          'This is the Pantry Management screen. Implement your pantry management features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class NutritionAnalysisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Analysis'),
      ),
      body: Center(
        child: Text(
          'This is the Nutrition Analysis screen. Implement your nutrition analysis features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// testDatabase () async {


//   // Create a FoodItem and add it to the items table
//   var fido = FoodItem(
//     id: 0,
//     name: 'Bones',
//     quantity: 35,
//     expiryDate: DateTime.parse('01/01/2200'),
//   );

//   await insertFoodItem(fido);

//   // Now, use the method above to retrieve all the items.
//   if (kDebugMode) {
//     print(await items());
//   } // Prints a list that include Fido.

//   // Update Fido's age and save it to the database.
//   fido = FoodItem(
//     id: fido.id,
//     name: fido.name,
//     quantity: fido.quantity - 5,
//     expiryDate: fido.expiryDate,
//   );
//   await updateFoodItem(fido);

//   // Print the updated results.
//   if (kDebugMode) {
//     print(await items());
//   } // Prints Fido with age 42.

//   // Delete Fido from the database.
//   await deleteFoodItem(fido.id);

//   // Print the list of items (empty).
//   if (kDebugMode) {
//     print(await items());
//   }
// }