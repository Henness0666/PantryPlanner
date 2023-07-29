import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/section.dart';
import 'package:pantry_app/Widgets/expandable_list.dart';
import 'package:pantry_app/Controllers/dark_mode_controller.dart';
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
      Selector<DarkModeController, bool>(
        selector: (context, menuController) => menuController.isExpanded,
        builder: (context, isExpanded, child) =>
            ExpandableList<DarkModeController>(
          title: const Text('Dark Mode'),
          subtitle: Selector<DarkModeController, DarkModeOption>(
            selector: (context, menuController) =>
                menuController.currentDarkModeOption,
            builder: (context, currentDarkModeOption, child) =>
                Text(darkModeNames[currentDarkModeOption]!),
          ),
          children: createOptionTiles(
            context,
            Provider.of<DarkModeController>(context),
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
