import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pantry_app/Controllers/theme_changer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Theme'),
      ),
      body: Center(
        child: Switch(
          value: theme.isDark(),
          onChanged: (value) {
            theme.toggleTheme();
          },
        ),
      ),
    );
  }
}
