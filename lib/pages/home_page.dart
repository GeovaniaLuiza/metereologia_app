// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Importa o serviço responsável por buscar latitude e longitude da cidade
import '../services/geo_service.dart';

// Importa a página de clima
import 'weather_page.dart';

// Criação da página inicial
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Estado da página inicial
class _HomePageState extends State<HomePage> {

  // Controller utilizado para capturar o texto digitado
  final controller = TextEditingController();

  // Instância do serviço de geolocalização
  final geo = GeoService();

  // Função responsável por buscar a cidade
  void search() async {

    // Busca informações da cidade digitada
    final city = await geo.getCity(controller.text);

    // Se não encontrar a cidade, encerra a função
    if (city == null) return;

    // Navega para a página de clima
    Navigator.push(

      // Contexto atual da aplicação
      context,

      // Cria a rota da nova página
      MaterialPageRoute(

        // Envia os dados para a página WeatherPage
        builder: (_) => WeatherPage(

          // Nome da cidade digitada
          city: controller.text,

          // Latitude da cidade
          lat: city["latitude"],

          // Longitude da cidade
          lon: city["longitude"],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // Estrutura principal da página
    return Scaffold(

      // Barra superior da aplicação
      appBar: AppBar(
        title: const Text("Meteorologia"),
      ),

      // Corpo da aplicação
      body: Column(
        children: [

          // Campo de texto para digitar a cidade
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Digite uma cidade",
              contentPadding: EdgeInsets.all(16),
            ),
          ),

          // Botão para iniciar a busca
          ElevatedButton(

            // Executa a função search()
            onPressed: search,

            child: const Text("Buscar"),
          ),
        ],
      ),
    );
  }
}