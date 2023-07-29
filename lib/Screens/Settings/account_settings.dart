import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/Widgets/custom_expansion_tile.dart';
import '/Controllers/dark_mode_controller.dart';
import '/Controllers/language_controller.dart';

class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({Key? key}) : super(key: key);

  final Map<DarkModeOption, String> darkModeNames = {
    DarkModeOption.system: 'System Default',
    DarkModeOption.light: 'Disabled',
    DarkModeOption.dark: 'Enabled',
  };

  final Map<LanguageOption, String> languageNames = {
    LanguageOption.system: 'System Default',
    LanguageOption.english: 'English',
    LanguageOption.spanish: 'Español',
    LanguageOption.french: 'Français',
    LanguageOption.german: 'Deutsch',
    LanguageOption.italian: 'Italiano',
    LanguageOption.portuguese: 'Português',
    LanguageOption.russian: 'Русский',
    LanguageOption.arabic: 'العربية',
    LanguageOption.hindi: 'हिन्दी',
    LanguageOption.japanese: '日本語',
    LanguageOption.korean: '한국어',
    LanguageOption.chineseSimplified: '简体中文',
    LanguageOption.chineseTraditional: '繁體中文',
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkModeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageController(),
        ),
        // Add more providers here if needed
      ],
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
              subtitle: const Text('John Doe'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change display name screen
              },
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: const Text('johndoe@example.com'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change email screen
              },
            ),
            ListTile(
              title: const Text('Phone'),
              subtitle: const Text('+1 123-456-7890'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to change phone screen
              },
            ),
            ListTile(
              title: const Text('Password'),
              subtitle: Text('⬤' * 11),
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
            Selector<DarkModeController, bool>(
              selector: (context, menuController) => menuController.isExpanded,
              builder: (context, isExpanded, child) =>
                  CustomExpansionTile<DarkModeController>(
                title: const Text('Dark Mode'),
                subtitle: Selector<DarkModeController, DarkModeOption>(
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
                      groupValue: Provider.of<DarkModeController>(context)
                          .currentDarkModeOption,
                      onChanged: (DarkModeOption? value) {
                        if (value != null) {
                          Provider.of<DarkModeController>(context,
                                  listen: false)
                              .setDarkModeOption(value);
                        }
                      },
                    ),
                    onTap: () {
                      Provider.of<DarkModeController>(context, listen: false)
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
            Selector<LanguageController, bool>(
              selector: (context, menuController) => menuController.isExpanded,
              builder: (context, isExpanded, child) =>
                  CustomExpansionTile<LanguageController>(
                title: const Text('Language'),
                subtitle: Selector<LanguageController, LanguageOption>(
                  selector: (context, menuController) =>
                      menuController.currentLanguageOption,
                  builder: (context, currentLanguageOption, child) =>
                      Text(languageNames[currentLanguageOption]!),
                ),
                children: LanguageOption.values.map((option) {
                  return ListTile(
                    title: Text(languageNames[option]!),
                    trailing: Radio<LanguageOption>(
                      value: option,
                      groupValue: Provider.of<LanguageController>(context)
                          .currentLanguageOption,
                      onChanged: (LanguageOption? value) {
                        if (value != null) {
                          Provider.of<LanguageController>(context,
                                  listen: false)
                              .setLanguageOption(value);
                        }
                      },
                    ),
                    onTap: () {
                      Provider.of<LanguageController>(context, listen: false)
                          .setLanguageOption(option);
                    },
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
