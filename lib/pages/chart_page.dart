import 'package:flutter/material.dart';
import '../widgets/forecast_chart.dart';

class ChartPage extends StatelessWidget {

  final List<double> data;

  const ChartPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gráfico")),

      body: Center(
        child: ForecastChart(temps: data),
      ),
    );
  }
}