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
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
