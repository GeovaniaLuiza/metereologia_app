import 'package:flutter/material.dart';
import '../services/geo_service.dart';
import 'weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = TextEditingController();
  final geo = GeoService();

  void search() async {
    final city = await geo.getCity(controller.text);

    if (city == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WeatherPage(
          city: controller.text,
          lat: city["latitude"],
          lon: city["longitude"],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meteorologia")),

      body: Column(
        children: [

          TextField(controller: controller),

          ElevatedButton(
            onPressed: search,
            child: const Text("Buscar"),
          ),
        ],
      ),
    );
  }
}