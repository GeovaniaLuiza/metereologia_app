import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {

  final double? temp;

  const WeatherCard({super.key, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),

      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Text(
          temp != null ? "${temp!.toStringAsFixed(1)}°C" : "Sem dados",
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}