import 'package:flutter/material.dart';
import 'package:pantry_app/Screens/Settings/settings_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
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
                    Navigator.pushNamed(context, '/foodTracking');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bar_chart),
                  title: const Text('Nutrition Analysis'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/nutritionAnalysis');
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Divider(), // optional
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & Feedback'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/help');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
