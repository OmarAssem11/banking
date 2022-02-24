import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() => setState(() {}));
    final themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: TextStyle(color: themeColor.secondary),
        hintText: focusNode.hasFocus ? widget.text : '',
        hintStyle: TextStyle(color: themeColor.secondary),
        prefixIcon: Icon(
          widget.prefix,
          color: themeColor.secondary,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      autocorrect: false,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "${widget.text} can't be empty";
        }
        return null;
      },
    );
  }
}
