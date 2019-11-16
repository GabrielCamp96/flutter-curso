import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Calculadora IMC",
      home: Home(),
      color: Colors.green,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.replay,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Icon(
            Icons.person_outline,
          ),
        ],
      ),
    );
  }
}
