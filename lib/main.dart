import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Borrar()));
}

class Borrar extends StatefulWidget {
  const Borrar({super.key});

  @override
  State<Borrar> createState() => _BorrarState();
}

class _BorrarState extends State<Borrar> {
  final TextEditingController _controller = TextEditingController();

  void _mostrarDialogoConfirmacion(BuildContext context, {required int index}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmar"),
          content: const Text("¿Seguro que quieres borrar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo sin hacer nada
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Ejecuta la acción de borrado
                // Por ejemplo, borra el primer elemento
                setState(() {
                  items.removeAt(
                    index,
                  ); // Borra el elemento en la posición index
                });
                Navigator.pop(context); // Cierra el diálogo
              },
              child: const Text("Sí"),
            ),
          ],
        );
      },
    );
  }

  List<String> items = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _mostrarDialogoConfirmacion(
                        context,
                        index: index,
                      ); // Muestra el diálogo de confirmación
                    },
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Ingrese un nuevo elemento",
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                items.add(
                  _controller.text,
                ); // Agrega un nuevo elemento a la lista
                _controller.clear(); // Limpia el campo de texto
              });
            },
            child: const Text("Agregar Elementos"),
          ),
        ],
      ),
    );
  }
}
