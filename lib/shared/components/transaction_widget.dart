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
    final textTheme = Theme.of(context).textTheme;
    final dateFormat = DateFormat('dd-MMMM  HH:mm');
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: textTheme.bodyText1,
              ),
              const SizedBox(height: 3),
              Text(
                dateFormat.format(dateTime),
                style: textTheme.subtitle2,
              ),
            ],
          ),
          const Spacer(),
          Text(
            isAdded ? '+\$$amount' : '-\$$amount',
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
