import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const MyTextInput({
    super.key, required this.hintText, required this.controller, required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: .8),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: .8),
              borderRadius: const BorderRadius.all(Radius.circular(16)))),
    );
  }
}
