class SearchBox extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Row(
        children: [

          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Cidade",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(width: 10),

          ElevatedButton(
            onPressed: onSearch,
            child: const Text("Buscar"),
          ),
        ],
      ),
    );
  }
}