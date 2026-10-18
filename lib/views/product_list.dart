import 'package:flutter/material.dart';
import 'package:prima_app/models/products.dart';
import 'package:prima_app/views/welcome_view.dart';
import 'dart:convert';
//pacchetto di funzioni di servizio per leggere file JSON
import 'package:flutter/services.dart' show rootBundle;

//! non ho capito

Future<List<Product>> loadProduct() async {
  //carica il contenuto del file JSON come stringa da assets
  String jsonString = await rootBundle.loadString('assets/data/products.json');
  //decodifica il JSON in una lista
  List<dynamic> jsonList = jsonDecode(jsonString);
  //converte ogni elemento della lista JSON in un oggetto Product
  return jsonList
      .map((item) => Product.fromJson(item as Map<String, dynamic>))
      .toList();
}

class ProductList extends StatefulWidget {
  ProductList({super.key, required this.category});

  final String category;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  //* Funzione per caricare i prodotti dal file JSON
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar

      appBar: AppBar(
        //* presto.it in appbar
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/welcome');
          },
          child: Text.rich(
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
      ),

      //* Prodotti
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${widget.category}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF668968),
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("errore nel caricamento dei dati"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("Nessun prodotto disponibile"));
                }

                //* grid dei prodotti

                List<Product> products = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 600
                        ? 3
                        : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      color: const Color(0xFFE9E1D3),
                      child: Column(
                        children: [
                          Expanded(

                            // ClipRRect è un widget che serve per arrotondare gli angoli di un widget figlio, in questo caso l'immagine del prodotto.
                            // avvolge image.network per arrotondare gli angoli superiori dell'immagine (pensavo esistesse un top generico, ma mi sa di no)

                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                products[index].urImg,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Text(
                            products[index].name,
                            style: const TextStyle(
                              color: Color(0xFF668968),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "€ ${products[index].price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Color(0xFF668968),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
