import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/shared/components/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key? key}) : super(key: key);
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<TransactionsProvider>(context);
    final transactions = provider.transactions;
    final transactionsUsers = provider.transactionsUsers;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          color: theme.colorScheme.tertiary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'Transactions',
                style: theme.textTheme.headline3,
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) => TransactionWidget(
                  name: transactionsUsers[index].name,
                  amount: transactions[index].amount,
                  imageUrl: transactionsUsers[index].imageUrl,
                  dateTime: transactions[index].dateTime.toDate(),
                ),
                itemCount: transactions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
