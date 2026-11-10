import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: login()));
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        error = 'Por favor ingresa tu nombre';
                        return error;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Correo'),
                    validator: (value) {
                      if (value == null || value.contains('@') == false) {
                        error = 'Por favor ingresa tu correo válido';
                        return error;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().length < 6) {
                        error =
                            'Por favor ingresa una contraseña de al menos 6 caracteres';
                        return error;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registro exitoso')),
                        );
                      }
                    },
                    child: Text('Registrarme'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
