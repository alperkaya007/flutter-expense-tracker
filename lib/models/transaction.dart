import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final TransactionType type;
  final String category;
  final DateTime date;
  final String? note;

  Transaction({
    String? id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    DateTime? date,
    this.note,
  })  : id = id ?? const Uuid().v4(),
        date = date ?? DateTime.now();

  bool get isIncome => type == TransactionType.income;
  bool get isExpense => type == TransactionType.expense;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'amount': amount,
        'type': type.name,
        'category': category,
        'date': Timestamp.fromDate(date),
        'note': note,
      };

  factory Transaction.fromMap(Map<String, dynamic> map) => Transaction(
        id: map['id'],
        title: map['title'],
        amount: (map['amount'] as num).toDouble(),
        type: TransactionType.values.byName(map['type']),
        category: map['category'],
        date: (map['date'] as Timestamp).toDate(),
        note: map['note'],
      );
}