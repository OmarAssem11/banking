import 'package:banking/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const routeName = '/home_layout';
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final provider = Provider.of<GlobalProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.screensTitles[provider.selectedScreenIndex],
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: themeColor.onPrimary,
        shape: Border(
          bottom: BorderSide(
            color: themeColor.onPrimary,
          ),
        ),
        elevation: !provider.isDark ? 0 : null,
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/closeup-shot-handsome-male-smiling_181624-41237.jpg?t=st=1645017567~exp=1645018167~hmac=c2d6cb8dbfe99bf3ce481bd273d46d5520b5be7fb92b4ae203980ab22736e69a&w=1060',
            ),
            radius: 22,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: provider.screens[provider.selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeColor.onPrimary,
        selectedItemColor: themeColor.onSecondary,
        unselectedItemColor: themeColor.secondary,
        currentIndex: provider.selectedScreenIndex,
        onTap: provider.bottomNavbarOnTap,
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
