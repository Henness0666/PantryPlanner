import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/auth_stream_builder.dart';
import 'package:provider/provider.dart';
import 'package:pantry_app/dynamic_theme.dart';
import 'package:pantry_app/Screens/activity_feed_screen.dart';
import 'package:pantry_app/Screens/pantry_screen.dart';
import 'package:pantry_app/Screens/meal_planning_screen.dart';
import 'package:pantry_app/Screens/shopping_list_screen.dart';
import 'package:pantry_app/Controllers/dark_mode_list.dart';
import 'package:pantry_app/Controllers/language_list.dart';
import 'package:pantry_app/Controllers/theme_changer.dart';
import 'package:pantry_app/Controllers/language.dart';
import 'package:pantry_app/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pantry_app/Screens/recipes_screen.dart';
import 'package:pantry_app/Screens/Settings/settings_screen.dart';
import 'package:pantry_app/Screens/help_screen.dart';
import 'package:pantry_app/Screens/food_tracking_screen.dart';
import 'package:pantry_app/Screens/nutrition_analysis_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check if you are running in development mode (Local emulator)
  bool isLocalEmulator = true; // Set this based on your app's environment
  if (isLocalEmulator) {
    // Set the storageBucket to the local emulator's host and port
    await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

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
  final List<Widget> _widgetOptions = [
    const MealPlanningScreen(), // Meal Planning Screen
    const RecipesScreen(), // Notifications Screen
    const ActivityFeedScreen(), // Home/Dashboard Screen
    const PantryScreen(), // Pantry Screen
    const ShoppingListScreen(), // Shopping List Screen
  ];

  final List<String> _pageTitleOptions = [
    'Meal Plans', // Meal Planning Screen
    'Recipes', // Notifications Screen
    'Activity Feed', // Home/Dashboard Screen
    'Pantries', // Pantry Screen
    'Shopping Lists', // Shopping List Screen
  ];

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
        widgetOptions: _widgetOptions,
        pageTitleOptions: _pageTitleOptions,
      ),
      routes: {
        '/foodTracking': (context) => const FoodTrackingScreen(),
        '/nutritionAnalysis': (context) => const NutritionAnalysisScreen(),
        '/help': (context) => const HelpScreen(),
      },
    );
  }
}
