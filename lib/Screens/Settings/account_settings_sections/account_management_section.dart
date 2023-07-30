import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/section.dart';

class AccountManagementSection extends Section {
  const AccountManagementSection({Key? key}) : super(key: key);

  @override
  Widget header() {
    return Text(
      'Account Details',
      style: headerTextStyle, // Use the style from the abstract class
    );
  }

  @override
  List<Widget> body() {
    return [
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
    ];
  }
}
