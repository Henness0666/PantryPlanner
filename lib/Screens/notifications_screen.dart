import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Hero(
          tag: 'appBar',
          child: AppBar(
            automaticallyImplyLeading: false, // This line removes the back button
            title: const Text('Notifications'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // Close the screen when the button is pressed
                },
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Your notifications will appear here.'),
      ),
    );
  }
}
