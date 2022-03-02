import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  final snackBar = SnackBar(
    backgroundColor: const Color.fromARGB(255, 2, 117, 5),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(message),
        const Icon(
          Icons.done,
          color: Colors.white,
          size: 26,
        )
      ],
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
