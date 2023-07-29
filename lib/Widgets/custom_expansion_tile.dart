import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Controllers/settings_menu_controller.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  @override
  final Key? key;

  const CustomExpansionTile({
    required this.title,
    this.subtitle,
    required this.children,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsMenuController>(
      builder: (context, menuController, _) {
        return ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            if (isExpanded) {
              menuController.collapseDarkMode();
            } else {
              menuController.expandDarkMode();
            }
          },
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: title,
                  subtitle: subtitle, // Use the subtitle here
                  onTap: () {
                    // Handling tap here
                    if (isExpanded) {
                      menuController.collapseDarkMode();
                    } else {
                      menuController.expandDarkMode();
                    }
                  },
                );
              },
              body: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: menuController.isDarkModeExpanded ? null : 0,
                child: Column(children: children),
              ),
              isExpanded: menuController.isDarkModeExpanded,
            ),
          ],
        );
      },
    );
  }
}
