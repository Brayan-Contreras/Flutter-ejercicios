import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Interruptor()));
}

class Interruptor extends StatefulWidget {
  const Interruptor({super.key});

  @override
  _InterruptorState createState() {
    return _InterruptorState();
  }
}

class _InterruptorState extends State<Interruptor> {
  bool Encendido = false;

  void _toggleSwitch() {
    setState(() {
      Encendido = !Encendido;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Encendido ? Colors.grey[300] : Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Encendido ? 'ON' : 'OFF', style: TextStyle(fontSize: 32)),
            SizedBox(height: 20),
            Icon(
              Encendido ? Icons.lightbulb : Icons.lightbulb_outline,
              size: 100,
              color: Encendido ? Colors.yellow : Colors.white,
            ),
            SizedBox(height: 20),
            Switch(
              value: Encendido,
              onChanged: (value) {
                _toggleSwitch();
              },
            ),
          ],
        ),
      ),
    );
  }
}
