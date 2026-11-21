import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  final respuesta = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
  );
  print(respuesta.statusCode);
  print(respuesta.body);
}
