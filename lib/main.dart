import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'Data Models/food_item.dart';

void main() {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  final db = openDatabase('0');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 2;

  final List<Widget> _widgetOptions = [
    const PantryScreen(), // Pantry Screen
    const ShoppingListScreen(), // Shopping List Screen
    const HomeScreen(), // Home/Dashboard Screen
    const MealPlanningScreen(), // Meal Planning Screen
    const NotificationsScreen(), // Notifications Screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              label: 'Pantry',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Shopping List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Meal Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Alerts',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor:
              Colors.grey, // Change this color as per your requirement
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class PantryScreen extends StatelessWidget {
  const PantryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry'),
      ),
      body: const Center(
        child: Text(
          'This is the Pantry screen. Implement your pantry features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

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

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text(
          'This is the Notifications screen. Implement your notifications features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

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
                  MaterialPageRoute(
                      builder: (context) => const PantryManagementScreen()),
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

// Placeholder screens for Food Tracking, Pantry Management, and Nutrition Analysis
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

class PantryManagementScreen extends StatelessWidget {
  const PantryManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry Management'),
      ),
      body: const Center(
        child: Text(
          'This is the Pantry Management screen. Implement your pantry management features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class NutritionAnalysisScreen extends StatelessWidget {
  const NutritionAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Analysis'),
      ),
      body: const Center(
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