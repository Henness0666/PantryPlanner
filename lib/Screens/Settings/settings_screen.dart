import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

import 'package:pantry_app/Screens/Settings/account_settings.dart';
import 'package:pantry_app/Screens/Settings/notifications_settings.dart';
import 'package:pantry_app/Screens/Settings/privacy_settings.dart';
import 'package:pantry_app/Utils/navigation_utils.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback signOut;

  const SettingsScreen({Key? key, required this.signOut}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  String appVersion = '';
  String osVersion = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion = androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      osVersion = iosInfo.systemVersion;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Account'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              NavigationUtils.navigateWithoutTransition(context, const AccountSettingsScreen());
            },
          ),
          ListTile(
            title: const Text('Devices'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to devices screen.
            },
          ),
          ListTile(
            title: const Text('Connections'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to linked accounts screen.
            },
          ),
          ListTile(
            title: const Text('Subscriptions'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to billing screen.
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Privacy Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Privacy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              NavigationUtils.navigateWithoutTransition(context, const PrivacySettingsScreen());
            },
          ),
          ListTile(
            title: const Text('Sharing'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to sharing settings screen.
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'App Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Appearance'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to appearance screen.
            },
          ),
          ListTile(
            title: const Text('Accessibility'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to accessibility screen.
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              NavigationUtils.navigateWithoutTransition(
                  context, const NotificationsSettingsScreen());
            },
          ),
          ListTile(
            title: const Text('Language'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: Navigate to language screen.
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () async {
              final confirm = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirm Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('No'),
                    ),
                  ],
                ),
              );

              if (confirm) {
                widget.signOut(); // Call the signOut method passed from AuthStreamBuilder
              }
            },
          ),
          const Divider(),
          //Row of just the social media icons with no text, linking to the respective social media pages
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.facebook),
                onPressed: () {
                  //TODO: Link to facebook page
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.instagram),
                onPressed: () {
                  //TODO: Link to instagram page
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.twitter),
                onPressed: () {
                  //TODO: Link to twitter page
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.youtube),
                onPressed: () {
                  //TODO: Link to youtube page
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.tiktok),
                onPressed: () {
                  //TODO: Link to tiktok page
                },
              ),
            ],
          ),

          // Add this at the end of your ListView children
          ListTile(
              title: Text('App Version: $appVersion\nOS Version: $osVersion',
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0))),
        ],
      ),
    );
  }
}
