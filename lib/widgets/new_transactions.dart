import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData(),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('No Date Chosen!'),
                        ElevatedButton(onPressed: (){}, child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold),), style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).primaryColor)),)
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => submitData,
                    child: Text('Add Transaction'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Theme.of(context).primaryColor)),
                  )
                ])));
  }
}
