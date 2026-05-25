import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import 'chart_page.dart';

class WeatherPage extends StatefulWidget {

  final String city;
  final double lat;
  final double lon;

  const WeatherPage({
    super.key,
    required this.city,
    required this.lat,
    required this.lon,
  });

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final service = WeatherService();

  double temp = 0;
  List<double> forecast = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final data = await service.getWeather(widget.lat, widget.lon);

    setState(() {
      temp = data["current_weather"]["temperature"];
      forecast = List<double>.from(data["daily"]["temperature_2m_max"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.city)),

      body: Column(
        children: [

          Text("$temp °C"),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChartPage(data: forecast),
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