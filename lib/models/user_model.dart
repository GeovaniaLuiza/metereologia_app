// Modelo de dados do usuário
// Representa informações básicas usadas no aplicativo

class UserModel {

  // Nome do usuário
  final String name;

  // Cidade escolhida pelo usuário
  final String city;

  // Latitude da cidade
  final double lat;

  // Longitude da cidade
  final double lon;

  // Construtor do modelo
  UserModel({
    required this.name,
    required this.city,
    required this.lat,
    required this.lon,
  });
}