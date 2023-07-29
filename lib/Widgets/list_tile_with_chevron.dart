import 'package:flutter/material.dart';

class ListTileWithChevron extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const ListTileWithChevron({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
