import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 13, 67, 106),
      ),
      home: Lista(),
    ),
  );
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() {
    return _Lista();
  }
}

class Tarea {
  String texto;
  bool completada;
  Tarea(this.texto, this.completada);
}

class _Lista extends State<Lista> {
  TextEditingController cosa = TextEditingController();
  List<Tarea> tareas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: cosa,
              decoration: InputDecoration(hintText: 'Escribe una tarea'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tareas.add(Tarea(cosa.text, false));
                });
              },
              child: Text('Agregar tarea'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tareas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tareas[index].texto,
                      style: TextStyle(
                        decoration: tareas[index].completada
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: Checkbox(
                      value: tareas[index].completada,
                      onChanged: (bool? value) {
                        setState(() {
                          tareas[index].completada = !tareas[index].completada;
                        });
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          tareas.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
