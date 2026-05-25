import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userController = TextEditingController();
  final passController = TextEditingController();

  // 🔐 LOGIN TEMPORÁRIO (FIXO)
  final String tempUser = "admin";
  final String tempPass = "123";

  void login() {

    if (userController.text == tempUser &&
        passController.text == tempPass) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário ou senha inválidos"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Login Temporário",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text("Entrar"),
            ),

            const SizedBox(height: 10),

            const Text(
              "Usuário: admin | Senha: 123",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}