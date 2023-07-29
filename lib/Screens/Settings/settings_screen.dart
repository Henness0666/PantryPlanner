import 'package:flutter/material.dart';
import 'package:pantry_app/Screens/Settings/notifications_settings.dart';
import 'package:pantry_app/Screens/Settings/privacy_settings.dart';
import 'package:pantry_app/Screens/Settings/security_settings.dart';

import '/Screens/Settings/account_settings.dart';
import '/Utils/navigation_utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Account Settings'),
            trailing: const Icon(Icons.chevron_right), // Arrow icon at the end
            onTap: () {
              NavigationUtils.navigateWithoutTransition(
                  context, AccountSettingsScreen());
            },
          ),
          ListTile(
            title: const Text('Privacy Settings'),
            trailing: const Icon(Icons.chevron_right), // Arrow icon at the end
            onTap: () {
              NavigationUtils.navigateWithoutTransition(
                  context, const PrivacySettingsScreen());
            },
          ),
          ListTile(
            title: const Text('Security Settings'),
            trailing: const Icon(Icons.chevron_right), // Arrow icon at the end
            onTap: () {
              NavigationUtils.navigateWithoutTransition(
                  context, const SecuritySettingsScreen());
            },
          ),
          ListTile(
            title: const Text('Notification Settings'),
            trailing: const Icon(Icons.chevron_right), // Arrow icon at the end
            onTap: () {
              NavigationUtils.navigateWithoutTransition(
                  context, const NotificationsSettingsScreen());
            },
          ),
        ],
      ),
    );
  }
}
