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

  Map<String, dynamic> toJson() {
    return {'nombre': nombre, 'latitud': latitud, 'longitud': longitud};
  }
}

class JJSon extends StatefulWidget {
  const JJSon({super.key});

  @override
  State<JJSon> createState() => _JJSonState();
}

Map<String, dynamic> datos = {
  'nombre': 'Parque Central',
  'latitud': 40.7128,
  'longitud': -74.0060,
};

class _JJSonState extends State<JJSon> {
  @override
  Widget build(BuildContext context) {
    final lugar = Lugar.fromJson(datos);
    final mapa = lugar.toJson();
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(lugar.nombre),
              subtitle: Text(
                'Latitud: ${mapa['latitud']}, Longitud: ${mapa['longitud']}',
              ),
            );
          },
        ),
      ),
    );
  }
}
