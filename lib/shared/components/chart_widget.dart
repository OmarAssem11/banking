import 'package:banking/models/transaction_model.dart';
import 'package:banking/shared/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    required this.title,
    required this.transactions,
  });
  final String title;
  final List<TransactionModel> transactions;
  List<TransactionModel> get recentTransactions => transactions
      .where(
        (tx) => tx.dateTime
            .toDate()
            .isAfter(DateTime.now().subtract(const Duration(days: 7))),
      )
      .toList();
  List<Map<String, dynamic>> get groupedTransactionsValues =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: 6 - index));
        var totalSum = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          final transactionDate = recentTransactions[i].dateTime.toDate();
          if (transactionDate.day == weekDay.day &&
              transactionDate.month == weekDay.month &&
              transactionDate.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum,
        };
      });
  double get totalSpending => groupedTransactionsValues.fold(
        0.0,
        (sum, item) => sum + (item['amount'] as double),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: groupedTransactionsValues
                  .map(
                    (data) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                        label: data['day'] as String,
                        amount: data['amount'] as double,
                        percentage: totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
