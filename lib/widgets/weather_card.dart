// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Widget responsável por exibir a temperatura atual
class WeatherCard extends StatelessWidget {

  // Variável que recebe a temperatura
  final double? temp;

  // Construtor do widget
  const WeatherCard({
    super.key,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {

    // Cartão visual para mostrar a temperatura
    return Card(

      // Espaçamento externo do cartão
      margin: const EdgeInsets.all(20),

      // Espaçamento interno do cartão
      child: Padding(
        padding: const EdgeInsets.all(30),

        // Texto exibindo temperatura
        child: Text(

          // Verifica se existe temperatura
          temp != null

              // Exibe temperatura formatada
              ? "${temp!.toStringAsFixed(1)}°C"

              // Caso não exista temperatura
              : "Sem dados",

          // Estilo do texto
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}