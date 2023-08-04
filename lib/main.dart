import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/auth_stream_builder.dart';
import 'package:provider/provider.dart';

import 'package:pantry_app/Widgets/side_menu.dart';
import 'package:pantry_app/dynamic_theme.dart';
import 'package:pantry_app/Screens/home_screen.dart';
import 'package:pantry_app/Screens/pantry_screen.dart';
import 'package:pantry_app/Screens/meal_planning_screen.dart';
import 'package:pantry_app/Screens/shopping_list_screen.dart';
import 'package:pantry_app/Screens/notifications_screen.dart';
import 'package:pantry_app/Screens/food_tracking_screen.dart';
import 'package:pantry_app/Screens/nutrition_analysis_screen.dart';
import 'package:pantry_app/Screens/Settings/settings_screen.dart';
import 'package:pantry_app/Screens/about_screen.dart';
import 'package:pantry_app/Screens/help_screen.dart';
import 'package:pantry_app/Screens/login_screen.dart';
import 'package:pantry_app/Screens/register_screen.dart';
import 'package:pantry_app/Screens/forgot_password_screen.dart';
import 'package:pantry_app/Controllers/dark_mode_list.dart';
import 'package:pantry_app/Controllers/language_list.dart';
import 'package:pantry_app/Controllers/theme_changer.dart';
import 'package:pantry_app/Controllers/language.dart';
import 'package:pantry_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Using local emulator for Firebase Auth
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // Load the saved theme preference
  DarkModeOption savedThemePreference = await ThemeChanger.loadThemePreference();

  // Determine the initial theme
  ThemeData initialTheme;
  if (savedThemePreference == DarkModeOption.system) {
    Brightness currentSystemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    initialTheme = currentSystemBrightness == Brightness.dark
        ? DynamicTheme.darkTheme
        : DynamicTheme.lightTheme;
  } else if (savedThemePreference == DarkModeOption.dark) {
    initialTheme = DynamicTheme.darkTheme;
  } else {
    initialTheme = DynamicTheme.lightTheme;
  }

  runApp(
    MultiProvider(
      providers: [
        Provider<FirebaseAuth>(
          create: (_) => FirebaseAuth.instance,
        ),
        Provider<FirebaseFirestore>(
          create: (_) => FirebaseFirestore.instance,
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(
            themeData: initialTheme,
            darkModeOption: savedThemePreference,
          ),
        ),
        ChangeNotifierProxyProvider<ThemeChanger, DarkModeListController>(
          create: (context) {
            final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
            return DarkModeListController(themeChanger, themeChanger.getDarkModeOption);
          },
          update: (context, themeChanger, darkModeController) =>
              DarkModeListController(themeChanger, themeChanger.getDarkModeOption),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageListController(),
        ),
        // Add more providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class Firestore {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
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
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() async {
    final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    final darkModePreference = await ThemeChanger.loadThemePreference();

    if (darkModePreference == DarkModeOption.system) {
      themeChanger.setSystemTheme();
    }
  }

  @override
  void didChangeLocales(List<Locale>? locales) async {
    final languageController = Provider.of<LanguageController>(context, listen: false);
    final savedLocalePreference = await languageController.loadLocalePreference();

    if (savedLocalePreference != locales![0]) {
      languageController.setLocale(savedLocalePreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Pantry Planner',
      theme: theme.getTheme(),
      home: AuthStreamBuilder(
        pageController: _pageController,
        widgetOptions: _widgetOptions,
        pageTitleOptions: _pageTitleOptions,
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
