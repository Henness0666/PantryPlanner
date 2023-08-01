import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/section.dart';
import 'package:pantry_app/Widgets/expandable_list.dart';
import 'package:pantry_app/Controllers/dark_mode_list.dart';
import 'package:provider/provider.dart';
import '/Utils/widget_helpers.dart';

class DisplaySection extends Section {
  DisplaySection({Key? key}) : super(key: key);

  final Map<DarkModeOption, String> darkModeNames = {
    DarkModeOption.system: 'System Default',
    DarkModeOption.light: 'Disabled',
    DarkModeOption.dark: 'Enabled',
  };

  @override
  Widget header() {
    return Text(
      'Display Settings',
      style: headerTextStyle, // Use the style from the abstract class
    );
  }

  @override
  List<Widget> body() {
    return [
      Selector<DarkModeListController, bool>(
        selector: (context, menuController) => menuController.isExpanded,
        builder: (context, isExpanded, child) =>
            ExpandableList<DarkModeListController>(
          title: const Text('Dark Mode'),
          subtitle: Selector<DarkModeListController, DarkModeOption>(
            selector: (context, menuController) =>
                menuController.currentDarkModeOption,
            builder: (context, currentDarkModeOption, child) =>
                Text(darkModeNames[currentDarkModeOption]!),
          ),
          children: createOptionTiles(
            context,
            Provider.of<DarkModeListController>(context),
            DarkModeOption.values, // Provide the values here
            darkModeNames,
            (controller) => controller.currentDarkModeOption,
            (controller, option) => controller.setDarkModeOption(option),
          ),
        ),
      ),
    ];
  }
}
