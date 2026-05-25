// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Importa a página inicial do aplicativo
import 'home_page.dart';

// Criação da página de login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Estado da página de login
class _LoginPageState extends State<LoginPage> {

  // Controller do campo usuário
  final userController = TextEditingController();

  // Controller do campo senha
  final passController = TextEditingController();

  // Usuário temporário fixo
  final String tempUser = "admin";

  // Senha temporária fixa
  final String tempPass = "123";

  // Função responsável pelo login
  void login() {

    // Verifica se usuário e senha estão corretos
    if (userController.text == tempUser &&
        passController.text == tempPass) {

      // Navega para a HomePage
      Navigator.pushReplacement(

        // Contexto atual
        context,

        // Criação da rota da página
        MaterialPageRoute(

          // Página de destino
          builder: (_) => const HomePage(),
        ),
      );

    } else {

      // Exibe mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text("Usuário ou senha inválidos"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    // Estrutura principal da tela
    return Scaffold(

      // Barra superior da aplicação
      appBar: AppBar(
        title: const Text("Login"),
      ),

      // Espaçamento interno da tela
      body: Padding(
        padding: const EdgeInsets.all(20),

        // Organiza os componentes verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Título da tela
            const Text(
              "Login Temporário",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Campo de usuário
            TextField(

              // Controller do campo
              controller: userController,

              decoration: const InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // Campo de senha
            TextField(

              // Controller da senha
              controller: passController,

              // Oculta os caracteres digitados
              obscureText: true,

              decoration: const InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Botão de login
            ElevatedButton(

              // Executa a função login()
              onPressed: login,

              child: const Text("Entrar"),
            ),

            const SizedBox(height: 10),

            // Informações do login temporário
            const Text(
              "Usuário: admin | Senha: 123",

              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}