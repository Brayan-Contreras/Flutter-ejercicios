import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: JJSon()));
}

class Lugar {
  String nombre;
  double latitud;
  double longitud;

  Lugar.fromJson(Map<String, dynamic> json)
    : nombre = json['nombre'],
      latitud = json['latitud'],
      longitud = json['longitud'];
}

class JJSon extends StatefulWidget {
  const JJSon({super.key});

  @override
  State<JJSon> createState() => _JJSonState();
}

List<Map<String, dynamic>> datos = [
  {'nombre': 'Parque Central', 'latitud': 40.7128, 'longitud': -74.0060},
  {'nombre': 'Plaza', 'latitud': 7.3756, 'longitud': -72.6479},
];

class _JJSonState extends State<JJSon> {
  @override
  Widget build(BuildContext context) {
    final lugares = datos.map((d) => Lugar.fromJson(d)).toList();
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: lugares.length,
          itemBuilder: (context, index) {
            final lugar = lugares[index];
            return ListTile(
              title: Text(lugar.nombre),
              subtitle: Text(
                'Latitud: ${lugar.latitud}, Longitud: ${lugar.longitud}',
              ),
            );
          },
        ),
      ),
    );
  }
}
