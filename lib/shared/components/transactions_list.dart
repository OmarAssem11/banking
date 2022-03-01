import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/shared/components/transaction_widget.dart';
import 'package:banking/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<TransactionsProvider>(context);
    final transactions = provider.transactions;
    final transactionsUsers = provider.transactionsUsers;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          color: theme.colorScheme.tertiary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'Transactions',
                style: theme.textTheme.headline3,
              ),
            ),
            if (transactionsUsers.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, index) => TransactionWidget(
                    name: transactionsUsers[index].name,
                    amount: transactions[index].amount,
                    imageUrl: transactionsUsers[index].imageUrl,
                    dateTime: transactions[index].dateTime.toDate(),
                    isAdded:
                        // ignore: avoid_bool_literals_in_conditional_expressions
                        transactions[index].receiverUId == uId ? true : false,
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
