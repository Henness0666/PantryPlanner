import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final String title;

  const BaseScreen({Key? key, required this.body, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        // Your drawer contents...
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
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
              leading: const Icon(Icons.kitchen),
              title: const Text('Pantry Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pantry');
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
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/logout');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/exit');
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
