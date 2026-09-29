import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Semaforo()));
}

class Semaforo extends StatefulWidget {
  const Semaforo({super.key});

  @override
  State<Semaforo> createState() => _SemaforoState();
}

class _SemaforoState extends State<Semaforo> {
  /*Color rojo = Color.fromARGB(255, 255, 0, 0);
  Color verde = Color.fromARGB(255, 0, 255, 0);
  Color amarillo = Color.fromARGB(255, 255, 255, 0);
  bool switchColor = true; */

  int currentColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: currentColorIndex == 0 ? Colors.red : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: currentColorIndex == 1 ? Colors.yellow : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: currentColorIndex == 2 ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentColorIndex = (currentColorIndex + 1) % 3;
                });
              },
              child: Text('Cambiar Color'),
            ),
          ],
        ),
      ),
    );
  }
}
