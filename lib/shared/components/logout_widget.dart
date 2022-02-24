import 'package:banking/providers/bottom_nav_bar_provider.dart';
import 'package:banking/providers/card_provider.dart';
import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget();
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xff3282B8),
      fontWeight: FontWeight.bold,
    );
    return Container(
      margin: const EdgeInsets.only(
        right: 27,
        left: 22,
        top: 16,
      ),
      child: InkWell(
        onTap: () {
          final dialog = AlertDialog(
            title: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'NO',
                  style: textStyle,
                ),
              ),
              TextButton(
                onPressed: () => logout(context),
                child: const Text(
                  'YES',
                  style: textStyle,
                ),
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (_) => dialog,
          );
        },
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color.fromARGB(255, 212, 5, 5),
              child: Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Logout',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    final navigator = Navigator.of(context);
    final transactionsProvider = Provider.of<TransactionsProvider>(
      context,
      listen: false,
    );
    navigator.popUntil((route) => route.isFirst);
    navigator.pushReplacementNamed(LoginScreen.routeName);
    Provider.of<BottomNavBarProvider>(
      context,
      listen: false,
    ).selectedScreenIndex = 0;
    Provider.of<CardProvider>(
      context,
      listen: false,
    ).cardModel = null;
    transactionsProvider.transactions.clear();
    transactionsProvider.transactionsUsers.clear();
  }
}
