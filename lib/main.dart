import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MapScreen()));
}

List<String> locations = [
  'Location 1',
  'Location 2',
  'Location 3',
  'Location 4',
  'Location 5',
];

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ...locations.map((location) => ListTile(title: Text(location))),
          ],
        ),
      ),
    );
  }
}
