import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dashboard_screen.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(transactionsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (transactions) {
          final byCategory = <String, double>{};
          for (final t in transactions.where((t) => t.isExpense)) {
            byCategory[t.category] = (byCategory[t.category] ?? 0) + t.amount;
          }
          final sections = byCategory.entries.map((e) =>
            PieChartSectionData(value: e.value, title: e.key, radius: 80)).toList();
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const Text('Expenses by Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              SizedBox(height: 250, child: PieChart(PieChartData(sections: sections))),
            ]),
          );
        },
      ),
    );
  }
}
