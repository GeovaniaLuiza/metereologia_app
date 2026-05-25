// Importa biblioteca responsável por converter JSON
import 'dart:convert';

// Importa biblioteca HTTP para realizar requisições na API
import 'package:http/http.dart' as http;

// Classe responsável pelas consultas da API de clima
class WeatherService {

  // Função assíncrona que busca dados meteorológicos
  Future<Map<String, dynamic>> getWeather(
    double lat,
    double lon,
  ) async {

    // Cria a URL da API Open-Meteo
    final url = Uri.parse(

      // Endpoint da previsão do tempo
      "https://api.open-meteo.com/v1/forecast"

      // Latitude da cidade
      "?latitude=$lat"

      // Longitude da cidade
      "&longitude=$lon"

      // Retorna clima atual
      "&current_weather=true"

      // Retorna previsão de temperaturas máximas diárias
      "&daily=temperature_2m_max"

      // Ajusta automaticamente o fuso horário
      "&timezone=auto",
    );

    // Realiza requisição GET
    final res = await http.get(url);

    // Converte resposta JSON em Map
    return jsonDecode(res.body);
  }
}