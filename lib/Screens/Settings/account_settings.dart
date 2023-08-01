import 'package:flutter/material.dart';
import 'package:pantry_app/Controllers/theme_changer.dart';
import 'package:provider/provider.dart';
import '../../Controllers/dark_mode_list.dart';
import '../../Controllers/language_list.dart';
import '/Screens/Settings/account_settings_sections/account_details_section.dart';
import '/Screens/Settings/account_settings_sections/account_management_section.dart';
import '/Screens/Settings/account_settings_sections/display_section.dart';
import '/Screens/Settings/account_settings_sections/language_section.dart';
import '/Screens/Settings/account_settings_sections/two_factor_authentication_section.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DarkModeListController(
              themeChanger, themeChanger.getDarkModeOption),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageListController(),
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
