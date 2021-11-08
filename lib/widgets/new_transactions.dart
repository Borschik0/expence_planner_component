import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
final titleController = TextEditingController();
final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: 'Title'
                    ),),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                        labelText: 'Amount'
                    ),),
                  ElevatedButton(onPressed: () => print(titleController.text), child: Text('Add Transaction'), style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple)
                  ),)
                ]
            )
        )
    );
  }
}
