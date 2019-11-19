import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MaterialApp(
      title: "Calculadora IMC",
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _peso = 0;
  double _altura = 0;
  double _resultado = 0;
  String _mensagem = "Informe seus dados!";
  TextEditingController _imcAltura = TextEditingController();
  TextEditingController _imcPeso = TextEditingController();

  void _limpaCampos() {
    setState(() {
      _imcAltura.text = "";
      _imcPeso.text = "";
      _resultado = 0;
      _mensagem = "Informe seus dados!";
    });
  }

  void calcularImc(double peso, double altura) {
    setState(() {
      _resultado = double.parse((peso / pow(altura, 2)).toStringAsFixed(1));
      if (_resultado < 18.5) _mensagem = "IMC $_resultado: Magreza";
      if (_resultado > 18.5 && _resultado < 25)
        _mensagem = "IMC $_resultado: Normal";
      if (_resultado >= 25 && _resultado < 30)
        _mensagem = "IMC $_resultado: Sobrepeso";
      if (_resultado > 30 && _resultado < 40)
        _mensagem = "IMC $_resultado: Obesidade";
      if (_resultado >= 40) _mensagem = "IMC $_resultado: Obesidade grave";
    });
  }

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
            onPressed: () {
              _limpaCampos();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.person_outline,
                color: Colors.green[300],
                size: 120,
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: TextFormField(
              controller: _imcPeso,
              decoration: InputDecoration.collapsed(
                  hintText: 'Peso (kg)',
                  hintStyle: TextStyle(color: Colors.green[300])),
              style: TextStyle(color: Colors.green[300]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: TextFormField(
              controller: _imcAltura,
              decoration: InputDecoration.collapsed(
                  hintText: 'Altura (m)',
                  hintStyle: TextStyle(color: Colors.green[300])),
              style: TextStyle(color: Colors.green[300]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 390.0,
                    child: RaisedButton(
                      child: Text("Calcular"),
                      color: Colors.green[300],
                      onPressed: () {
                        _peso = double.parse(_imcPeso.text);
                        _altura = double.parse(_imcAltura.text);
                        calcularImc(_peso, _altura);
                      },
                      splashColor: Colors.green[300],
                      textColor: Colors.white,
                    ),
                  )),
            ],
          ),
          Text(
            "${_resultado == 0 ? "Informe seus dados!" : "$_mensagem"}",
            style: TextStyle(
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }
}
