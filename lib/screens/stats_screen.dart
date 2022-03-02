import 'package:banking/models/transaction_model.dart';
import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/shared/components/chart_widget.dart';
import 'package:banking/shared/components/transactions_list.dart';
import 'package:banking/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);
  static const routeName = '/stats_screen';
  @override
  Widget build(BuildContext context) {
    final transactions =
        Provider.of<TransactionsProvider>(context).transactions;
    return Scaffold(
      body: transactions.isNotEmpty
          ? SlidingUpPanel(
              color: Theme.of(context).colorScheme.tertiary,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(40)),
              minHeight: 230,
              body: Column(
                children: [
                  ChartWidget(
                    title: 'Incoming transfers',
                    transactions: getIncomingTransfers(transactions),
                  ),
                  ChartWidget(
                    title: 'Outgoing transfers',
                    transactions: getOutgoingTransfers(transactions),
                  ),
                ],
              ),
              panel: const TransactionsList(),
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

  List<TransactionModel> getOutgoingTransfers(
    List<TransactionModel> allTransactions,
  ) =>
      allTransactions.where((tx) => tx.senderUId == uId).toList();
  List<TransactionModel> getIncomingTransfers(
    List<TransactionModel> allTransactions,
  ) =>
      allTransactions.where((tx) => tx.receiverUId == uId).toList();
}
