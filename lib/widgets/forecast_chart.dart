// Importa biblioteca responsável pelos gráficos
import 'package:fl_chart/fl_chart.dart';

// Importa componentes visuais do Flutter
import 'package:flutter/material.dart';

// Widget responsável por exibir o gráfico de previsão
class ForecastChart extends StatelessWidget {

  // Lista de temperaturas recebidas da API
  final List<double> temps;

  // Construtor do widget
  const ForecastChart({
    super.key,
    required this.temps,
  });

  @override
  Widget build(BuildContext context) {

    // Define a área do gráfico
    return SizedBox(
      height: 250,

      // Widget do gráfico de barras
      child: BarChart(

        // Configurações do gráfico
        BarChartData(

          // Cria os grupos de barras
          barGroups: temps.asMap().entries.map((e) {

            // Cada barra do gráfico
            return BarChartGroupData(

              // Posição da barra no eixo X
              x: e.key,

              // Configuração da barra
              barRods: [

                BarChartRodData(

                  // Altura da barra
                  toY: e.value,

                  // Cor da barra
                  color: Colors.blue,
                )
              ],
            );

          }).toList(),
        ),
      ),
    );
  }
}