import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Controllers/dark_mode_controller.dart';
import '/Controllers/language_controller.dart';
import '/Screens/Settings/account_settings_sections/account_details_section.dart';
import '/Screens/Settings/account_settings_sections/account_management_section.dart';
import '/Screens/Settings/account_settings_sections/display_section.dart';
import '/Screens/Settings/account_settings_sections/language_section.dart';
import '/Screens/Settings/account_settings_sections/two_factor_authentication_section.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

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
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            const AccountDetailsSection(),
            const TwoFactorAuthenticationSection(),
            DisplaySection(),
            LanguageSection(),
            const AccountManagementSection(),
          ],
        ),
      ),
    );
  }
}
