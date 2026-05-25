import 'dart:convert';
import 'package:http/http.dart' as http;

class GeoService {

  Future<Map<String, dynamic>?> getCity(String city) async {

    final url = Uri.parse(
      "https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1",
    );

    final res = await http.get(url);
    final data = jsonDecode(res.body);

    if (data["results"] == null) return null;

    return data["results"][0];
  }
}