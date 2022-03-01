import 'package:banking/providers/theme_provider.dart';
import 'package:banking/screens/edit_profile_screen.dart';
import 'package:banking/shared/components/logout_widget.dart';
import 'package:banking/shared/components/setting_switch.dart';
import 'package:banking/shared/components/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          const SettingsWidget(
            text: 'Edit profile',
            color: Colors.orange,
            icon: Icons.person,
            routeName: EditProfileScreen.routeName,
          ),
          SettingSwitch(
            text: 'Dark mode',
            color: Colors.blueGrey,
            icon: Icons.dark_mode,
            value: provider.isDark,
            onChange: (_) => provider.switchTheme(),
          ),
          const LogoutWidget(),
        ],
      ),
    );
  }
}
