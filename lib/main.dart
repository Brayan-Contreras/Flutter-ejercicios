import 'package:flutter/material.dart';
import 'segundaPantalla.dart';

void main() {
  runApp(MaterialApp(home: EdSegPAntalla()));
}

class EdSegPAntalla extends StatefulWidget {
  const EdSegPAntalla({super.key});

  @override
  State<EdSegPAntalla> createState() => _EdSegPAntallaState();
}

List<String> items = ['Item 1', 'Item 2', 'Item 3'];

class _EdSegPAntallaState extends State<EdSegPAntalla> {
  String? resultado;
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
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SegundaPantalla(item: items[index]),
                    ),
                  );
                  if (resultado != null) {
                    setState(() {
                      items[index] = resultado as String;
                    });
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
