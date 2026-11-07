import 'package:flutter/material.dart';

class SegundaPantalla extends StatelessWidget {
  final String item;
  const SegundaPantalla({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Controller = TextEditingController(text: item);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: Controller),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context, Controller.text);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
