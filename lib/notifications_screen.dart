import 'package:flutter/material.dart';
import 'base_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Notifications',
      body: Center(
        child: Text(
          'This is the Notifications screen. Implement your notifications features here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
