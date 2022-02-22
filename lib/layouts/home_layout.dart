import 'package:banking/providers/bottom_nav_bar_provider.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const routeName = '/home_layout';
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final navBarProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          navBarProvider.screensTitles[navBarProvider.selectedScreenIndex],
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
              Provider.of<LoginProvider>(context).userModel.imageUrl,
            ),
            radius: 22,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: navBarProvider.screens[navBarProvider.selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeColor.onPrimary,
        selectedItemColor: themeColor.onSecondary,
        unselectedItemColor: themeColor.secondary,
        currentIndex: navBarProvider.selectedScreenIndex,
        onTap: navBarProvider.bottomNavbarOnTap,
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
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
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
