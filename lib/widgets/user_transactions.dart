import 'package:flutter/material.dart';

import 'new_transactions.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Book', amount: 12.34, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Breakfast', amount: 50.4, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[NewTransaction(), TransactionList(_userTransactions)]);
  }
}
