import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFormField({required this.controller});
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final focusNode = FocusNode();
  late bool isObscure;
  @override
  void initState() {
    isObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() => setState(() {}));
    final themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      decoration: InputDecoration(
        hintText: focusNode.hasFocus ? 'Password' : '',
        labelStyle: TextStyle(color: themeColor.secondary),
        labelText: 'Password',
        hintStyle: TextStyle(color: themeColor.secondary),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: themeColor.secondary,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: themeColor.secondary,
          ),
          onPressed: () => setState(() => isObscure = !isObscure),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      obscureText: isObscure,
      autocorrect: false,
      enableSuggestions: false,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password can't be empty";
        }
        return null;
      },
    );
  }
}
