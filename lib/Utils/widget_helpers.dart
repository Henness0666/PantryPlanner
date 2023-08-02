import 'package:flutter/material.dart';
import '../Controllers/expandable.dart';

List<Widget> createOptionTiles<T extends ExpandableController, O>(
  BuildContext context,
  T controller,
  List<O> options, // Add this parameter
  Map<O, String> optionNames,
  O Function(T) getCurrentOption,
  Function(T, O) setCurrentOption,
) {
  return options.map((option) {
    return ListTile(
      title: Text(optionNames[option]!),
      trailing: Radio<O>(
        value: option,
        groupValue: getCurrentOption(controller),
        onChanged: (O? value) {
          if (value != null) {
            setCurrentOption(controller, value);
          }
        },
      ),
      onTap: () {
        setCurrentOption(controller, option);
      },
    );
  }).toList();
}
