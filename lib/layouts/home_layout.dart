import 'package:banking/providers/user_provider.dart';
import 'package:banking/screens/card_screen.dart';
import 'package:banking/screens/settings_screen.dart';
import 'package:banking/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const routeName = '/home_layout';
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedScreenIndex = 0;
  List<Widget> screens = const [
    CardScreen(),
    StatsScreen(),
    SettingsScreen(),
  ];
  List<String> screensTitles = const [
    'Card',
    'Stats',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColor = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screensTitles[selectedScreenIndex],
          style: theme.textTheme.headline3,
        ),
        shape: Border(
          bottom: BorderSide(
            color: themeColor.onPrimary,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              Provider.of<UserProvider>(context).userModel!.imageUrl,
            ),
            radius: 22,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: screens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeColor.onPrimary,
        selectedItemColor: themeColor.onSecondary,
        unselectedItemColor: themeColor.secondary,
        currentIndex: selectedScreenIndex,
        onTap: (index) {
          setState(() {
            selectedScreenIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
