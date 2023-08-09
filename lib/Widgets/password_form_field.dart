import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const PasswordFormField({super.key, required this.controller, required this.labelText});

  @override
  PasswordFormFieldState createState() => PasswordFormFieldState();
}

class PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            // Toggle the state from visible to hidden or vice versa
            setState(() => _obscureText = !_obscureText);
          },
        ),
      ),
    );
  }
}
