import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/Widgets/custom_expansion_tile.dart';
import '/Controllers/settings_menu_controller.dart';

class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({Key? key}) : super(key: key);

  final Map<DarkModeOption, String> darkModeNames = {
    DarkModeOption.system: 'System Default',
    DarkModeOption.light: 'Disabled',
    DarkModeOption.dark: 'Enabled',
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsMenuController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Account Details',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            ListTile(
              title: const Text('Display Name'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change display name screen
              },
            ),
            ListTile(
              title: const Text('Email'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change email screen
              },
            ),
            ListTile(
              title: const Text('Phone'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change phone screen
              },
            ),
            ListTile(
              title: const Text('Password'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Two-Factor Authentication',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            ListTile(
              title: const Text('Show Backup Codes'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to enable/disable 2FA screen
              },
            ),
            ListTile(
              title: const Text('Remove 2FA'),
              onTap: () {
                // Navigate to enable/disable 2FA screen
              },
            ),
            ListTile(
              title: const Text('SMS Backup Authentication'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
              onTap: () {
                // Navigate to enable/disable SMS Backup screen
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Display',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            Selector<SettingsMenuController, bool>(
              selector: (context, menuController) =>
                  menuController.isDarkModeExpanded,
              builder: (context, isExpanded, child) => CustomExpansionTile(
                title: const Text('Dark Mode'),
                subtitle: Selector<SettingsMenuController, DarkModeOption>(
                  selector: (context, menuController) =>
                      menuController.currentDarkModeOption,
                  builder: (context, currentDarkModeOption, child) =>
                      Text(darkModeNames[currentDarkModeOption]!),
                ),
                children: DarkModeOption.values.map((option) {
                  return ListTile(
                    title: Text(darkModeNames[option]!),
                    trailing: Radio<DarkModeOption>(
                      value: option,
                      groupValue: Provider.of<SettingsMenuController>(context)
                          .currentDarkModeOption,
                      onChanged: (DarkModeOption? value) {
                        if (value != null) {
                          Provider.of<SettingsMenuController>(context,
                                  listen: false)
                              .setDarkModeOption(value);
                        }
                      },
                    ),
                    onTap: () {
                      Provider.of<SettingsMenuController>(context,
                              listen: false)
                          .setDarkModeOption(option);
                    },
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Language',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            ListTile(
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: 'English',
                onChanged: (_) {},
                items: <String>['English', 'Spanish', 'French']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Account Management',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            ListTile(
              title: const Text('Disable Account'),
              onTap: () {
                // Prompt to disable account
              },
            ),
            ListTile(
              title: const Text(
                'Delete Account',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                // Prompt to delete account
              },
            ),
          ],
        ),
      ),
    );
  }
}
