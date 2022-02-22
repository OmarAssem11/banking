import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    required this.text,
    required this.onPressed,
  });
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(360, 60),
        ),
        backgroundColor: MaterialStateProperty.all(themeColor.onBackground),
        foregroundColor: MaterialStateProperty.all(themeColor.outline),
      ),
      onPressed: () {
        setState(() => isLoading = true);
        widget.onPressed();
      },
      child: isLoading
          ? CircularProgressIndicator(
              color: themeColor.outline,
            )
          : Text(
              widget.text.toUpperCase(),
              style: const TextStyle(fontSize: 18),
            ),
    );
  }
}
