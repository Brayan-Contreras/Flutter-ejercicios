import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Slidder()));
}

class Slidder extends StatefulWidget {
  const Slidder({super.key});

  @override
  State<Slidder> createState() => _SlidderState();
}

class _SlidderState extends State<Slidder> {
  double _value = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Slider(
                value: _value,
                min: 20,
                max: 200,
                label: _value.round().toString(),
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
              ),
            ),
            Icon(Icons.star, color: Colors.yellow, size: _value),
          ],
        ),
      ),
    );
  }
}
