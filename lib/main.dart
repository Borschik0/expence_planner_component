import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/new_transactions.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    fontFamily: 'Quicksand',
    textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.bold)),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold))
    )
  ),
    home: MainScreen()));

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Transaction> _userTransactions = [];

  List<Transaction>? get _recentTransactions {
    return _userTransactions.where(
        (tx){
          return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
        }
    ).toList();
  }
  void _addnewTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addnewTransactions),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Planner'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                return _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Chart(_recentTransactions!),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return _startAddNewTransaction(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
