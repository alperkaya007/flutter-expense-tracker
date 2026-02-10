import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String title, category;
  final double amount;
  final bool isIncome;
  final VoidCallback? onDelete;

  const TransactionCard({super.key, required this.title, required this.category, required this.amount, required this.isIncome, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isIncome ? Colors.green[100] : Colors.red[100],
          child: Icon(isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: isIncome ? Colors.green : Colors.red),
        ),
        title: Text(title),
        subtitle: Text(category),
        trailing: Text(
          '${isIncome ? "+" : "-"}₺${amount.toStringAsFixed(2)}',
          style: TextStyle(color: isIncome ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
