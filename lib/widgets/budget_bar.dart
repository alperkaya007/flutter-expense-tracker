import 'package:flutter/material.dart';

class BudgetBar extends StatelessWidget {
  final String category;
  final double spent, limit;

  const BudgetBar({super.key, required this.category, required this.spent, required this.limit});

  double get progress => (spent / limit).clamp(0.0, 1.0);
  bool get over => spent > limit;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(category),
        Text('₺${spent.toStringAsFixed(0)} / ₺${limit.toStringAsFixed(0)}',
            style: TextStyle(color: over ? Colors.red : null, fontWeight: over ? FontWeight.bold : null)),
      ]),
      const SizedBox(height: 4),
      LinearProgressIndicator(value: progress, color: over ? Colors.red : Colors.green, backgroundColor: Colors.grey[200]),
      const SizedBox(height: 12),
    ]);
  }
}
