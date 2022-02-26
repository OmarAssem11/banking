import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final String name;
  final double amount;
  final String imageUrl;
  final DateTime dateTime;
  final bool isAdded;
  const TransactionWidget({
    required this.name,
    required this.amount,
    required this.imageUrl,
    required this.dateTime,
    required this.isAdded,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd-MM-yyyy  hh:mm');
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 8,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 22,
            ),
          ),
          Column(
            children: [
              Text(
                name,
                style: theme.textTheme.headline2,
              ),
              Text(
                dateFormat.format(dateTime),
                style: theme.textTheme.subtitle2,
              ),
            ],
          ),
          const Spacer(),
          Text(
            isAdded ? '+\$$amount' : '-\$$amount',
            style: theme.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
