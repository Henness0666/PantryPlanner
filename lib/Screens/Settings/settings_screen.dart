import 'package:flutter/material.dart';
import 'package:pantry_app/Screens/Settings/notifications_settings.dart';
import 'package:pantry_app/Screens/Settings/privacy_settings.dart';
import 'package:pantry_app/Screens/Settings/security_settings.dart';
import 'package:provider/provider.dart';

import '/Widgets/custom_expansion_tile.dart';
import '/Controllers/settings_menu_controller.dart';
import '/Screens/Settings/account_settings.dart';
import '/Utils/navigation_utils.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

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
            ListTile(
              title: const Text('Account Settings'),
              trailing:
                  const Icon(Icons.chevron_right), // Arrow icon at the end
              onTap: () {
                NavigationUtils.navigateWithoutTransition(
                    context, AccountSettingsScreen());
              },
            ),
            ListTile(
              title: const Text('Privacy Settings'),
              trailing:
                  const Icon(Icons.chevron_right), // Arrow icon at the end
              onTap: () {
                NavigationUtils.navigateWithoutTransition(
                    context, const PrivacySettingsScreen());
              },
            ),
            ListTile(
              title: const Text('Security Settings'),
              trailing:
                  const Icon(Icons.chevron_right), // Arrow icon at the end
              onTap: () {
                NavigationUtils.navigateWithoutTransition(
                    context, const SecuritySettingsScreen());
              },
            ),
            ListTile(
              title: const Text('Notification Settings'),
              trailing:
                  const Icon(Icons.chevron_right), // Arrow icon at the end
              onTap: () {
                NavigationUtils.navigateWithoutTransition(
                    context, const NotificationsSettingsScreen());
              },
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
            ListTile(
              title: const Text('Notifications'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: const Text('Meal Reminders'),
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
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
          ],
        ),
      ),
    );
  }
}
