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
  List<Color> colores = [Colors.red, Colors.yellow, Colors.green];
  int currentColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: colores.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: index == currentColorIndex
                            ? colores[index]
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentColorIndex = (currentColorIndex + 1) % colores.length;
              });
            },
            child: Text('Cambiar Color'),
          ),
        ],
      ),
    );
  }
}
