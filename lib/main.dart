import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MaterialApp(home: MainScreen()));

class MainScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Book', amount: 12.34, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Breakfast', amount: 50.4, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Planner')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Chart 1'),
              color: Colors.grey,
            ),
          ),
          Card(color: Colors.lightBlue, child: Text('Chart 2')),
          Column(
            children: transactions
                .map((tx) => Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tx.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMMd().format(tx.date),
                                style: TextStyle(color: Colors.grey),
                              )
                            ])
                      ],
                    )))
                .toList(),
          )
        ],
      ),
    );
  }
}
