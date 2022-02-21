import 'package:banking/screens/home_screen.dart';
import 'package:banking/screens/settings_screen.dart';
import 'package:banking/screens/stats_screen.dart';
import 'package:banking/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarProvider with ChangeNotifier {
  List<Widget> screens = const [
    HomeScreen(),
    StatsScreen(),
    WalletScreen(),
    SettingsScreen(),
  ];

  List<String> screensTitles = const [
    'Home',
    'Stats',
    'Wallet',
    'Settings',
  ];

  int selectedScreenIndex = 0;

  void bottomNavbarOnTap(int index) {
    selectedScreenIndex = index;
    notifyListeners();
  }
}
