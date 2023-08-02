import 'package:flutter/material.dart';

import 'package:pantry_app/Widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Alerts',
      // The leading property defines the widget to display before the toolbar's title.
      // It is often used to display a back button.
      body: Center(
        child: Text(
          'Hello World!',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
