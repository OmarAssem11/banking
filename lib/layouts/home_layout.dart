import 'package:banking/providers/user_provider.dart';
import 'package:banking/screens/home_screen.dart';
import 'package:banking/screens/settings_screen.dart';
import 'package:banking/screens/transactions_screen.dart';
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
    HomeScreen(),
    TransactionsScreen(),
    SettingsScreen(),
  ];
  List<String> screensTitles = const [
    'Home',
    'Stats',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screensTitles[selectedScreenIndex],
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: themeColor.onPrimary,
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
            icon: Icon(Icons.home),
            label: 'Home',
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
