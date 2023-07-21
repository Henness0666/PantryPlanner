import 'package:flutter/material.dart';

void main() {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to Pantry Planner!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            Text(
              'Pantry Stats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                title: Text('Total Items'),
                trailing: Text(totalItems.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Low Stock Items'),
                trailing: Text(lowStockItems.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Expiring Soon Items'),
                trailing: Text(expiringSoonItems.toString()),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Alerts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Replace the following Text widgets with actual alerts and low food items
            ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text('Alert: Item A is going to expire in 2 days.'),
            ),
            ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text('Alert: Item B is running low.'),
            ),
            ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text('Alert: Item C is going to expire in 1 day.'),
            ),
            // Add more alerts as needed
          ],
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
