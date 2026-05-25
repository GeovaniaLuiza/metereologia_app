import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {

  Future<Map<String, dynamic>> getWeather(double lat, double lon) async {

    final url = Uri.parse(
      "https://api.open-meteo.com/v1/forecast"
      "?latitude=$lat&longitude=$lon"
      "&current_weather=true"
      "&daily=temperature_2m_max"
      "&timezone=auto",
    );

    final res = await http.get(url);
    return jsonDecode(res.body);
  }
}