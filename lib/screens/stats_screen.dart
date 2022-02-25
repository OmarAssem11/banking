import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);
  static const routeName = '/stats';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMMM');
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Text('Card Limit', style: theme.textTheme.headline1),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'CHANGE',
                  style: theme.textTheme.labelMedium,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: LinearProgressIndicator(
                    value: .3,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$ 154.28',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'left in ${dateFormat.format(DateTime.now())}',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
