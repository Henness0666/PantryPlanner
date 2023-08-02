import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/list_tile_with_chevron.dart';
import 'package:pantry_app/Widgets/section.dart';

class AccountDetailsSection extends Section {
  const AccountDetailsSection({Key? key}) : super(key: key);

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
      ListTileWithChevron(
        title: 'Display Name',
        subtitle: 'John Doe',
        onTap: () {
          // Navigate to change display name screen
        },
      ),
      ListTileWithChevron(
        title: 'Display Name',
        subtitle: 'John Doe',
        onTap: () {
          // Navigate to change display name screen
        },
      ),
      ListTileWithChevron(
        title: 'Email',
        subtitle: 'johndoe@example.com',
        onTap: () {
          // Navigate to change email screen
        },
      ),
      ListTileWithChevron(
        title: 'Phone',
        subtitle: '+1 123-456-7890',
        onTap: () {
          // Navigate to change phone screen
        },
      ),
      ListTileWithChevron(
        title: 'Password',
        subtitle: '⬤' * 11,
        onTap: () {
          // Navigate to change password screen
        },
      ),
      // Continue with other ListTiles...
    ];
  }
}
