import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/transaction.dart';
import '../services/firestore_service.dart';
import 'dashboard_screen.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});
  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _key = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _amount = TextEditingController();
  TransactionType _type = TransactionType.expense;

  @override
  void dispose() { _title.dispose(); _amount.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Form(
        key: _key,
        child: ListView(padding: const EdgeInsets.all(16), children: [
          SegmentedButton<TransactionType>(
            segments: const [
              ButtonSegment(value: TransactionType.expense, label: Text('Expense')),
              ButtonSegment(value: TransactionType.income, label: Text('Income')),
            ],
            selected: {_type},
            onSelectionChanged: (s) => setState(() => _type = s.first),
          ),
          const SizedBox(height: 16),
          TextFormField(controller: _title, decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()), validator: (v) => v!.isEmpty ? 'Required' : null),
          const SizedBox(height: 16),
          TextFormField(controller: _amount, decoration: const InputDecoration(labelText: 'Amount', prefixText: 'TRY ', border: OutlineInputBorder()), keyboardType: TextInputType.number, validator: (v) => double.tryParse(v!) == null ? 'Invalid' : null),
          const SizedBox(height: 24),
          FilledButton(onPressed: _submit, child: const Text('Save')),
        ]),
      ),
    );
  }

  void _submit() async {
    if (!_key.currentState!.validate()) return;
    await ref.read(firestoreServiceProvider).addTransaction(Transaction(title: _title.text, amount: double.parse(_amount.text), type: _type, category: 'Other'));
    if (mounted) context.pop();
  }
}
