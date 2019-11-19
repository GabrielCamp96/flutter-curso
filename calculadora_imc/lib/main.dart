import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  void _limpaCampos() {
    setState(() {
      _imcAltura.text = "";
      _imcPeso.text = "";
      _resultado = 0;
      _mensagem = "Informe seus dados!";
      _globalKey = GlobalKey<FormState>();
    });
  }

  void calcularImc(double peso, double altura) {
    setState(() {
      _resultado = double.parse((peso / pow(altura, 2)).toStringAsFixed(1));
      if (_resultado < 18.5)
        _mensagem = "IMC $_resultado: Magreza";
      else if (_resultado > 18.5 && _resultado < 25)
        _mensagem = "IMC $_resultado: Normal";
      else if (_resultado >= 25 && _resultado < 30)
        _mensagem = "IMC $_resultado: Sobrepeso";
      else if (_resultado > 30 && _resultado < 40)
        _mensagem = "IMC $_resultado: Obesidade";
      else
        _mensagem = "IMC $_resultado: Obesidade grave";
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
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.green,
                  size: 120,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: TextFormField(
                  controller: _imcPeso,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira seu peso!";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: TextFormField(
                  controller: _imcAltura,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: "Altura (m)",
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira sua altura!";
                    }
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        "Calcular",
                        style: TextStyle(fontSize: 25),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        if(_globalKey.currentState.validate()) {
                          _peso = double.parse(_imcPeso.text);
                          _altura = double.parse(_imcAltura.text);
                          calcularImc(_peso, _altura);
                        }
                      },
                      textColor: Colors.white,
                    ),
                  )),
              Text(
                "${_resultado == 0 ? "Informe seus dados!" : "$_mensagem"}",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
