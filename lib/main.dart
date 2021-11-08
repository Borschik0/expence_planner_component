import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(home: MainScreen()));

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Planner')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Chart 1'),
              color: Colors.grey,
            ),
          ),
          Card(color: Colors.lightBlue, child: Text('Chart 2')),

        ],
      ),
    );
  }
}
