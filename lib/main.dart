import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MainScreen()));

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Planner')),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart 1'),
              color: Colors.grey,
            ),
          ),
          Card(
            child: Text('Chart 2')
          ),
          Card(
            child: Text('List of transactions')
          )
        ],
      ),
    );
  }
}
