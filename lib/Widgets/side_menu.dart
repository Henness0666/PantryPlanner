import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Your drawer contents...
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
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
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
