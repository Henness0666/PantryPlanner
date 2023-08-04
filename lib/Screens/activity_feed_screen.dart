import 'package:flutter/material.dart';

import 'package:pantry_app/Widgets/base_screen.dart';

class ActivityFeedScreen extends StatelessWidget {
  const ActivityFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      title: 'Activity Feed',
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
