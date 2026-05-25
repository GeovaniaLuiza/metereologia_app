// Importa os componentes visuais do Flutter
import 'package:flutter/material.dart';

// Widget reutilizável para busca de cidade
class SearchBox extends StatelessWidget {

  // Controller responsável pelo campo de texto
  final TextEditingController controller;

  // Função executada ao clicar no botão buscar
  final VoidCallback onSearch;

  // Construtor do widget
  const SearchBox({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {

    // Espaçamento externo do componente
    return Padding(
      padding: const EdgeInsets.all(16),

      // Organiza os componentes horizontalmente
      child: Row(
        children: [

          // Faz o campo ocupar o máximo de espaço possível
          Expanded(

            // Campo de texto para digitar a cidade
            child: TextField(

              // Controller do campo
              controller: controller,

              // Aparência do campo
              decoration: const InputDecoration(

                // Texto de identificação
                labelText: "Cidade",

                // Borda do campo
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Espaçamento entre campo e botão
          const SizedBox(width: 10),

          // Botão de busca
          ElevatedButton(

            // Executa a função recebida
            onPressed: onSearch,

            // Texto do botão
            child: const Text("Buscar"),
          ),
        ],
      ),
    );
  }
}