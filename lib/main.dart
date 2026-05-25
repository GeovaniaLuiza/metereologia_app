// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Importa a página de login
import 'pages/login_page.dart';

// Função principal da aplicação
void main() {

  // Inicia o aplicativo Flutter
  runApp(const MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {

  // Construtor da classe
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Configuração principal do aplicativo
    return MaterialApp(

      // Remove a faixa DEBUG da tela
      debugShowCheckedModeBanner: false,

      // Página inicial do aplicativo
      home: const LoginPage(),
    );
  }
}