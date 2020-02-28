import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?format=json&key=a0a719dd";

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Future<Map> getData() async {
  http.Response response = await (http.get(request));
  return jsonDecode(response.body)["results"]["currencies"];
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _dolar;
  double _euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("\$   Conversor   \$"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Carregando Dados...",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar dados :(",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  _dolar = snapshot.data["USD"]["buy"];
                  _euro = snapshot.data["EUR"]["buy"];
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 150.0,
                          color: Colors.amber,
                        ),
                        buildTextField("Reais", "R\$"),
                        Divider(),
                        buildTextField("Dólares", "\$"),
                        Divider(),
                        buildTextField("Euros", "€"),
                      ],
                    ),
                  );
                }
            }
          },
        ));
  }
}


buildTextField(String label, String prefix) {
  return TextField(
      style: TextStyle(color: Colors.amber),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.amber, fontSize: 25.0),
          border: OutlineInputBorder(),
          prefixText: prefix,
          prefixStyle: TextStyle(color: Colors.amber),
          //colocar essa pra prefixtext
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          //colocar essa pra borda mudar cor na seleção
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              )) //colocar essa pra borda ficar OURO antes da seleção
      ),
  );
}