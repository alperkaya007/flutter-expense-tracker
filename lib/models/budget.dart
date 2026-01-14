import 'package:uuid/uuid.dart';

class Budget {
  final String id;
  final String category;
  final double limit;
  final int month;
  final int year;

  Budget({String? id, required this.category, required this.limit, required this.month, required this.year})
      : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap() => {'id': id, 'category': category, 'limit': limit, 'month': month, 'year': year};

  factory Budget.fromMap(Map<String, dynamic> map) => Budget(
        id: map['id'], category: map['category'],
        limit: (map['limit'] as num).toDouble(), month: map['month'], year: map['year'],
      );
}
