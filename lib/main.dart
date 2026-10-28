import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Mezclador()));
}

class Mezclador extends StatefulWidget {
  const Mezclador({super.key});

  @override
  _MezcladorState createState() {
    return _MezcladorState();
  }
}

class _MezcladorState extends State<Mezclador> {
  double rojo = 0.0;
  double verde = 0.0;
  double azul = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Slider(
              value: rojo,
              min: 0.0,
              max: 255.0,
              onChanged: (double valor) {
                setState(() {
                  rojo = valor;
                });
              },
            ),
          ),
          Text('Rojo: ${rojo.toInt()}'),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Slider(
              value: verde,
              min: 0.0,
              max: 255.0,
              onChanged: (double valor) {
                setState(() {
                  verde = valor;
                });
              },
            ),
          ),
          Text('Verde: ${verde.toInt()}'),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Slider(
              value: azul,
              min: 0.0,
              max: 255.0,
              onChanged: (double valor) {
                setState(() {
                  azul = valor;
                });
              },
            ),
          ),
          Text('Azul: ${azul.toInt()}'),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            color: Color.fromARGB(
              255,
              rojo.toInt(),
              verde.toInt(),
              azul.toInt(),
            ),
          ),
        ],
      ),
    );
  }
}
