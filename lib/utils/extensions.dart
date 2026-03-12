import "package:intl/intl.dart";

extension DateExt on DateTime {
  String get formatted => DateFormat("dd MMM yyyy").format(this);
  String get monthYear => DateFormat("MMMM yyyy").format(this);
  bool isSameMonth(DateTime o) => year == o.year && month == o.month;
}

extension DoubleExt on double {
  String get currency => "TRY ${toStringAsFixed(2)}";
}
