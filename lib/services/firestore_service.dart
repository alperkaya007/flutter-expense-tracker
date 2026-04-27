import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/transaction.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;
  CollectionReference get _transactions =>
      _db.collection('users').doc(_uid).collection('transactions');

  Stream<List<Transaction>> getTransactions() {
    return _transactions
        .orderBy('date', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Transaction.fromMap(doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<void> addTransaction(Transaction transaction) async {
    await _transactions.doc(transaction.id).set(transaction.toMap());
  }

  Future<void> deleteTransaction(String id) async {
    await _transactions.doc(id).delete();
  }

  Future<void> updateTransaction(Transaction transaction) async {
    await _transactions.doc(transaction.id).update(transaction.toMap());
  }

  Stream<double> getTotalBalance() {
    return getTransactions().map((transactions) {
      double balance = 0;
      for (final t in transactions) {
        if (t.isIncome) {
          balance += t.amount;
        } else {
          balance -= t.amount;
        }
      }
      return balance;
    });
  }
}