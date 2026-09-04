import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _App();
  }
}

class _App extends State<App> {
  bool carga = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            carga
                ? const CircularProgressIndicator()
                : const Text('No hay carga'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  carga = !carga;
                });

                await Future.delayed(const Duration(seconds: 2));

                setState(() {
                  carga = !carga;
                });
              },
              child: const Text('Cambiar estado'),
            ),
          ],
        ),
      ),
    );
  }
}
