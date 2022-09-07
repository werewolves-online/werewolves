import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController? controller;
  const TextInputField({
    this.label = 'Input Field',
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          contentPadding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
        ),
      ),
    );
  }
}
