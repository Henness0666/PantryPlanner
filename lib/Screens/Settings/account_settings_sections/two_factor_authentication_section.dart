import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/section.dart';
import 'package:pantry_app/Widgets/list_tile_with_chevron.dart';

class TwoFactorAuthenticationSection extends Section {
  const TwoFactorAuthenticationSection({super.key});

  @override
  Widget header() {
    return Text(
      'Two-Factor Authentication',
      style: headerTextStyle, // Use the style from the abstract class
    );
  }

  @override
  List<Widget> body() {
    return [
      ListTileWithChevron(
        title: 'Show Backup Codes',
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
        //TODO: Create a custom widget for trailing Switches
        title: const Text('SMS Backup Authentication'),
        trailing: Switch(
          value: true,
          onChanged: (value) {},
        ),
        onTap: () {
          // Navigate to enable/disable SMS Backup screen
        },
      ),
    ];
  }
}
