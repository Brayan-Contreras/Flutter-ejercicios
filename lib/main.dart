import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Cal_Propina()));
}

class Cal_Propina extends StatefulWidget {
  const Cal_Propina({super.key});

  @override
  _Cal_PropinaState createState() => _Cal_PropinaState();
}

class _Cal_PropinaState extends State<Cal_Propina> {
  double _total = 0.0;
  double _propina = 0.0;
  double _totalConPropina = 0.0;
  String? error;

  void _calcularPropina() {
    setState(() {
      _totalConPropina = _total + (_total * _propina / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Total de la cuenta'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _total = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Porcentaje de propina',
                errorText: error,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final numero = double.tryParse(value) ?? 0.0;
                if (numero > 30 || numero < 0) {
                  setState(() {
                    error = "Maximo 30%, Minimo 0%";
                  });
                }
                setState(() {
                  _propina = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPropina,
              child: Text('Calcular Propina'),
            ),
            SizedBox(height: 20),
            Text('Total con propina: \$${_totalConPropina.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
