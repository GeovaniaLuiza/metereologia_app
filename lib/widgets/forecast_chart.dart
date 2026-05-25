import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ForecastChart extends StatelessWidget {

  final List<double> temps;

  const ForecastChart({super.key, required this.temps});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 250,

      child: BarChart(
        BarChartData(
          barGroups: temps.asMap().entries.map((e) {
            return BarChartGroupData(
              x: e.key,
              barRods: [
                BarChartRodData(toY: e.value, color: Colors.blue)
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}