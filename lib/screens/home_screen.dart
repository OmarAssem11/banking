import 'package:banking/shared/components/credit_card.dart';
import 'package:banking/shared/components/transactions_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreditCard(),
          const TransactionsList(),
        ],
      ),
    );
  }
}
