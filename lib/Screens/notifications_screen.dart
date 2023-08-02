import 'package:flutter/material.dart';
import '../Widgets/base_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Alerts',
      // The leading property defines the widget to display before the toolbar's title.
      // It is often used to display a back button.
      body: Center(
        child: Text(
          'Alert content goes here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
