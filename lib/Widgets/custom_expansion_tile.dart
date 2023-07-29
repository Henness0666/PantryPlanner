import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Controllers/expandable_controller.dart';

class CustomExpansionTile<T extends ExpandableController>
    extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  final Key? key;

  const CustomExpansionTile({
    required this.title,
    this.subtitle,
    required this.children,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, menuController, _) {
        return ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            if (isExpanded) {
              menuController.collapse();
            } else {
              menuController.expand();
            }
          },
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: title,
                  subtitle: subtitle,
                  onTap: () {
                    if (isExpanded) {
                      menuController.collapse();
                    } else {
                      menuController.expand();
                    }
                  },
                );
              },
              body: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: menuController.isExpanded ? null : 0,
                child: Column(children: children),
              ),
              isExpanded: menuController.isExpanded,
            ),
          ],
        );
      },
    );
  }
}
