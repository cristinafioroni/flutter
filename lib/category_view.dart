import 'package:flutter/material.dart';
import 'views/product_list.dart';


class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final List<String> categories = ["Elettronica", "Casa", "Abbigliamento", "Animali"]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [

          //titolo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Categorie",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF668968),
                ),
              ),
            ),

          // lista delle categorie

          Expanded(
            child: ListView.builder(

        // la listView ha sempre children con listTile o altri widget come elementi della lista

        // parte statica della lista, builder vuole item builder
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.category),
            title: Text("${categories[index]}"),
            subtitle: Text("Descrizione ${categories[index]}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductList(
                  category: categories[index],
                )),
              );
            },
          );
        },  
         // itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
