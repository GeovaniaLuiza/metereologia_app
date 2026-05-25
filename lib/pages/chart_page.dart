// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Importa o widget do gráfico criado no projeto
import '../widgets/forecast_chart.dart';

// Criação da página de gráfico
class ChartPage extends StatelessWidget {

  // Lista de temperaturas que será enviada para o gráfico
  final List<double> data;

  // Construtor da página recebendo a lista de dados
  const ChartPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    // Estrutura principal da tela
    return Scaffold(

      // Barra superior da aplicação
      appBar: AppBar(
        title: const Text("Gráfico"),
      ),

      // Corpo da página
      body: Center(

        // Widget responsável por exibir o gráfico
        child: ForecastChart(

          // Envia a lista de temperaturas para o gráfico
          temps: data,
        ),
      ),
    );
  }
}