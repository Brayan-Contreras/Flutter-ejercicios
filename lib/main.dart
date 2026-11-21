import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final respuesta = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );
  print(respuesta.statusCode);
  final lista = jsonDecode(respuesta.body) as List;
  print(lista.length);
  print(lista[0]); // el primero, que es un Map
  print(lista[0]['title']);
  print(lista[lista.length - 1]['title']); // el ultimo title
}
