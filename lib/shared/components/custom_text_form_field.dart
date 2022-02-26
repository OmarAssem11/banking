import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData prefix;
  final TextInputType keyboardType;
  const CustomTextFormField({
    required this.controller,
    required this.text,
    required this.prefix,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: themeColor.secondary),
        prefixIcon: Icon(
          prefix,
          color: themeColor.secondary,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      autocorrect: false,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$text can't be empty";
        }
        return null;
      },
    );
  }
}
