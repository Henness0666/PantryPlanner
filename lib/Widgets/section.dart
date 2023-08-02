import 'package:flutter/material.dart';

abstract class Section extends StatelessWidget {
  const Section({Key? key}) : super(key: key);

  // Define common styles
  final TextStyle headerTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  // Define common padding
  final EdgeInsets commonPadding = const EdgeInsets.all(8.0);

  Widget header();

  List<Widget> body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: commonPadding,
          child: header(),
        ),
        ...body(),
      ],
    );
  }
}
