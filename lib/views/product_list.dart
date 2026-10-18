import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key, required this.category});

  final String category;

  // con la map dei prodotti possono associare nome, prezzo e immagine

  final List<Map<String, String>> products = [
    {"name": "Xbox", "price": "600 euro", "image": "https://picsum.photos/200"},
    {
      "name": "Playstation",
      "price": "500 euro",
      "image": "https://picsum.photos/200",
    },
    {
      "name": "Nintendo Switch",
      "price": "400 euro",
      "image": "https://picsum.photos/200",
    },
    {
      "name": "Game Boy Color",
      "price": "100 euro",
      "image": "https://picsum.photos/200",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar

      appBar: AppBar(
        //* presto.it in appbar
        title: Text.rich(
          const TextSpan(
            style: TextStyle(
              fontFamily: 'DM Serif Display',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "Presto.",
                style: TextStyle(color: Color(0xFF668968)),
              ),
              TextSpan(
                text: "it",
                style: TextStyle(color: Color(0xFFD97841)),
              ),
            ],
          ),
        ),
      ),

      //* Prodotti
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${category}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF668968),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card.filled(
                  color: const Color(0xFFE9E1D3),
                 

                  child: Column(
                    children: [
                      Image.network(
                        products[index]["image"] ?? "https://picsum.photos/200",
                      ),
                      Text(
                        products[index]["name"] ??
                            "Nome del prodotto non disponibile",
                      ),
                      Text(
                        products[index]["price"] ?? "Prezzo non disponibile",
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
