// Importa biblioteca para trabalhar com JSON
import 'dart:convert';

// Importa biblioteca HTTP para fazer requisições na API
import 'package:http/http.dart' as http;

// Classe responsável por buscar informações de cidades
class GeoService {

  // Função assíncrona que busca dados da cidade
  Future<Map<String, dynamic>?> getCity(String city) async {

    // Cria a URL da API de geolocalização
    final url = Uri.parse(

      // API Open-Meteo Geocoding
      "https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1",
    );

    // Faz requisição GET para a API
    final res = await http.get(url);

    // Converte resposta JSON para Map
    final data = jsonDecode(res.body);

    // Verifica se a cidade foi encontrada
    if (data["results"] == null) return null;

    // Retorna o primeiro resultado encontrado
    return data["results"][0];
  }
}