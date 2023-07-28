import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'home_screen.dart';
import 'pantry_screen.dart';
import 'meal_planning_screen.dart';
import 'shopping_list_screen.dart';
import 'notifications_screen.dart';
import 'food_tracking_screen.dart';
import 'nutrition_analysis_screen.dart';
import 'setting_screen.dart';
import 'about_screen.dart';
import 'help_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

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

  // Define your light and dark themes here
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    // Other theme properties...
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    // Other theme properties...
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Planner',
      theme: lightTheme, // Your light theme
      darkTheme: darkTheme, // Your dark theme
      routes: {
        '/': (context) => Scaffold(
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
        '/home': (context) => const HomeScreen(),
        '/foodTracking': (context) => const FoodTrackingScreen(),
        '/pantry': (context) => const PantryScreen(),
        '/nutritionAnalysis': (context) => const NutritionAnalysisScreen(),
        '/mealPlanning': (context) => const MealPlanningScreen(),
        '/shoppingList': (context) => const ShoppingListScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
        '/help': (context) => const HelpScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
      },
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