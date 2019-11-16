import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.overlay),
          child: Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: 0",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {debugPrint("+1");},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {debugPrint("-1");},
                  ),
                ),
              ],
            ),
            Text(
              "Pode entrar",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
