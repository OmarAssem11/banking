import 'package:banking/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ButtonStyle customButtonStyle({required BuildContext context}) {
  final themeColor = Theme.of(context).colorScheme;
  final provider = Provider.of<ThemeProvider>(context);
  return ButtonStyle(
    fixedSize: MaterialStateProperty.all(
      const Size(360, 60),
    ),
    backgroundColor: MaterialStateProperty.all(themeColor.onBackground),
    foregroundColor: provider.isDark
        ? MaterialStateProperty.all(themeColor.secondary)
        : MaterialStateProperty.all(Colors.white),
  );
}
