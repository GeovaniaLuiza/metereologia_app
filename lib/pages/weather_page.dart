// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Importa o serviço responsável pelas consultas da API do clima
import '../services/weather_service.dart';

// Importa a página responsável pelo gráfico
import 'chart_page.dart';

// Página de clima
class WeatherPage extends StatefulWidget {

  // Nome da cidade selecionada
  final String city;

  // Latitude da cidade
  final double lat;

  // Longitude da cidade
  final double lon;

  // Construtor da página
  const WeatherPage({
    super.key,
    required this.city,
    required this.lat,
    required this.lon,
  });

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

// Estado da página de clima
class _WeatherPageState extends State<WeatherPage> {

  // Instância do serviço de clima
  final service = WeatherService();

  // Variável da temperatura atual
  double temp = 0;

  // Lista utilizada no gráfico de previsão
  List<double> forecast = [];

  @override
  void initState() {

    // Executa ao abrir a página
    super.initState();

    // Carrega os dados da API
    load();
  }

  // Função responsável por buscar dados da API
  void load() async {

    // Consulta a API utilizando latitude e longitude
    final data = await service.getWeather(
      widget.lat,
      widget.lon,
    );

    // Atualiza os dados da tela
    setState(() {

      // Temperatura atual
      temp = data["current_weather"]["temperature"];

      // Lista de temperaturas máximas diárias
      forecast = List<double>.from(
        data["daily"]["temperature_2m_max"],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    // Estrutura principal da página
    return Scaffold(

      // Barra superior com nome da cidade
      appBar: AppBar(
        title: Text(widget.city),
      ),

      // Corpo da aplicação
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          // Exibe a temperatura atual
          Text(
            "$temp °C",

            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Botão para abrir o gráfico
          ElevatedButton(

            onPressed: () {

              // Navega para a página do gráfico
              Navigator.push(
                context,

                MaterialPageRoute(

                  // Envia os dados da previsão
                  builder: (_) => ChartPage(
                    data: forecast,
                  ),
                ),
              );
            },

            child: const Text("Gráfico"),
          ),
        ],
      ),
    );
  }
}