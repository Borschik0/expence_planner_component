import 'dart:io';

import '../widgets/adaptive_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx){
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState(){
    print('createState NewTransaction Widget');
    return _NewTransactionState();}
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _NewTransactionState(){
    print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    super.initState();
    print('initState()');
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
              padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                      onSubmitted: (_) => _submitData(),
                    ),
                    TextField(
                      controller: _amountController,
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitData(),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                  'Picked Date: ${DateFormat.yMd().format(_selectedDate)}')),
                          AdaptiveTextButton('Choose Date', _presentDatePicker)
                        ],
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: () => _submitData(),
                            child: Text(
                              'Add Transaction',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () => _submitData(),
                            child: Text('Add Transaction',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                  ]))),
    );
  }
}
