import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: FutureB()));
}

class FutureB extends StatefulWidget {
  const FutureB({super.key});

  @override
  State<FutureB> createState() => _FutureBState();
}

class Lugar {
  String nombre;
  double latitud;
  double longitud;
  Lugar({required this.nombre, required this.latitud, required this.longitud});

  Lugar.fromJson(Map<String, dynamic> json)
    : nombre = json['nombre'],
      latitud = json['latitud'],
      longitud = json['longitud'];
}

const textoJson =
    '{"nombre": "Catedral de Pamplona", "latitud": 7.3756, "longitud": -72.6479}';

class _FutureBState extends State<FutureB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () {
            final Map<String, dynamic> mapa = jsonDecode(textoJson);
            final lugar = Lugar.fromJson(mapa);
            return lugar;
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final lugar = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nombre: ${lugar.nombre}'),
                  Text('Latitud: ${lugar.latitud}'),
                  Text('Longitud: ${lugar.longitud}'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
