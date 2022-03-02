import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    required this.label,
    required this.amount,
    required this.percentage,
  });
  final String label;
  final double amount;
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            '\$${amount.toStringAsFixed(0)}',
            style: const TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          width: 18,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.blueGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
