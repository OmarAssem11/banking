import 'package:banking/components/components.dart';
import 'package:banking/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlobalProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Column(
        children: [
          settingsSwitch(
            context: context,
            text: 'Dark mode',
            color: Colors.blueGrey,
            icon: Icons.dark_mode,
            value: provider.isDark,
            onChange: (_) => provider.switchTheme(),
          ),
          settingsSwitch(
            context: context,
            text: 'Notifications',
            color: Colors.amber,
            icon: Icons.notifications,
            value: true,
            onChange: (_) {},
          ),
        ],
      ),
    );
  }
}
