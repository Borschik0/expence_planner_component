import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTX;

  TransactionList(this.transactions, this.deletTX);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'Add any transactions...',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/kitty.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      elevation: 5,
                      child: ListTile(
                          leading: CircleAvatar(
                            //  backgroundColor: Theme.of(context).primaryColor,
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                                ),
                              ),
                            ),
                          ),
                          title: Text(transactions[index].title,
                              style: Theme.of(context).textTheme.headline6),
                          subtitle: Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                      trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: ()=> deletTX(transactions[index].id),),),
                    )));
  }
}
