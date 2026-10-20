import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Textfil()));
}

class Textfil extends StatefulWidget {
  const Textfil({super.key});

  @override
  State<Textfil> createState() => _TextfilState();
}

List<String> items = ["Item 1", "Item 2", "Item 3"];

class _TextfilState extends State<Textfil> {
  bool mostrarCampo = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(items[index]));
              },
            ),

            SizedBox(
              height: 20,
            ), // Espacio entre la lista y el botón/campo de texto

            mostrarCampo
                ? TextField(
                    controller: _controller,
                    onSubmitted: (valor) {
                      setState(() {
                        items.add(valor);
                        _controller.clear();
                        mostrarCampo = false; // vuelve a mostrar el botón
                      });
                    },
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mostrarCampo = true; // ahora se dibuja el TextField
                      });
                    },
                    child: const Text("Agregar"),
                  ),
          ],
        ),
      ),
    );
  }
}
