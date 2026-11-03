import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Editar()));
}

class Editar extends StatefulWidget {
  const Editar({super.key});
  @override
  _EditarState createState() {
    return _EditarState();
  }
}

class _EditarState extends State<Editar> {
  void editar(int index, BuildContext context) {
    // Implement your edit logic here
    TextEditingController controller = TextEditingController();
    controller.text = items[index];
    AlertDialog alert = AlertDialog(
      title: Text('Editar Item'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: items[index]),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Guardar'),
          onPressed: () {
            // Save logic here
            setState(() {
              items[index] = controller.text;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    editar(index, context);
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
