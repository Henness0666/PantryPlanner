import 'package:flutter/material.dart';
import 'package:pantry_app/Widgets/section.dart';
import 'package:pantry_app/Widgets/expandable_list.dart';
import 'package:pantry_app/Controllers/language_list.dart';
import 'package:provider/provider.dart';
import '/Utils/widget_helpers.dart';

class LanguageSection extends Section {
  LanguageSection({Key? key}) : super(key: key);

  final Map<LanguageOption, String> languageNames = {
    LanguageOption.system: 'System Default',
    LanguageOption.english: 'English',
    LanguageOption.spanish: 'Español',
    LanguageOption.french: 'Français',
    LanguageOption.german: 'Deutsch',
    LanguageOption.italian: 'Italiano',
    LanguageOption.portuguese: 'Português',
    LanguageOption.russian: 'Русский',
    LanguageOption.arabic: 'العربية',
    LanguageOption.hindi: 'हिन्दी',
    LanguageOption.japanese: '日本語',
    LanguageOption.korean: '한국어',
    LanguageOption.chineseSimplified: '简体中文',
    LanguageOption.chineseTraditional: '繁體中文',
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
      Selector<LanguageListController, bool>(
        selector: (context, menuController) => menuController.isExpanded,
        builder: (context, isExpanded, child) =>
            ExpandableList<LanguageListController>(
          title: const Text('Language'),
          subtitle: Selector<LanguageListController, LanguageOption>(
            selector: (context, menuController) =>
                menuController.currentLanguageOption,
            builder: (context, currentLanguageOption, child) =>
                Text(languageNames[currentLanguageOption]!),
          ),
          children: createOptionTiles(
            context,
            Provider.of<LanguageListController>(context),
            LanguageOption.values, // Provide the values here
            languageNames,
            (controller) => controller.currentLanguageOption,
            (controller, option) => controller.setLanguageOption(option),
          ),
        ),
      ),
    ];
  }
}
