import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
final List<Transaction> transactions;

TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
    );
  }
}
