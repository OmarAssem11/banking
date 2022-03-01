import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/shared/components/chart_widget.dart';
import 'package:banking/shared/components/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);
  static const routeName = '/transactions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<TransactionsProvider>(context).transactions.isNotEmpty
          ? Column(
              children: [
                ChartWidget(
                  transactions:
                      Provider.of<TransactionsProvider>(context).transactions,
                ),
                const TransactionsList(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'No transactions yet ...',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 85, 84, 84),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Image.asset(
                  'assets/images/waiting.png',
                  height: 200,
                ),
              ],
            ),
    );
  }
}
