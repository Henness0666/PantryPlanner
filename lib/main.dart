import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/side_menu.dart';
import 'package:provider/provider.dart';
//import 'package:sqflite/sqflite.dart';

import 'dynamic_theme.dart';
import '/Screens/home_screen.dart';
import '/Screens/pantry_screen.dart';
import '/Screens/meal_planning_screen.dart';
import '/Screens/shopping_list_screen.dart';
import '/Screens/notifications_screen.dart';
import '/Screens/food_tracking_screen.dart';
import '/Screens/nutrition_analysis_screen.dart';
import '/Screens/Settings/settings_screen.dart';
import '/Screens/about_screen.dart';
import '/Screens/help_screen.dart';
import '/Screens/login_screen.dart';
import '/Screens/register_screen.dart';
import '/Screens/forgot_password_screen.dart';
import '/Controllers/dark_mode_controller.dart';
import '/Controllers/language_controller.dart';
import 'Controllers/theme_changer.dart';

void main() {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkModeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageController(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(DynamicTheme.lightTheme),
        ),
        // Add more providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final PageController _pageController = PageController(initialPage: 2);
  int _selectedIndex = 2;

  final List<Widget> _widgetOptions = [
    const PantryScreen(), // Pantry Screen
    const ShoppingListScreen(), // Shopping List Screen
    const HomeScreen(), // Home/Dashboard Screen
    const MealPlanningScreen(), // Meal Planning Screen
    const NotificationsScreen(), // Notifications Screen
  ];

  final List<String> _pageTitleOptions = [
    'Pantry', // Pantry Screen
    'Shopping List', // Shopping List Screen
    'Home', // Home/Dashboard Screen
    'Meal Plan', // Meal Planning Screen
    'Alerts', // Notifications Screen
  ];

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Pantry Planner',
      theme: theme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_pageTitleOptions[_selectedIndex]),
        ),
        drawer: const SideMenu(),
        body: PageView(
          controller: _pageController,
          children: _widgetOptions,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
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
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
      routes: {
        '/foodTracking': (context) => const FoodTrackingScreen(),
        '/nutritionAnalysis': (context) => const NutritionAnalysisScreen(),
        '/settings': (context) => SettingsScreen(),
        '/about': (context) => const AboutScreen(),
        '/help': (context) => const HelpScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
