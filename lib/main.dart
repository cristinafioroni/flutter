import 'package:flutter/material.dart';
import 'views/welcome_view.dart';
import 'views/category_view.dart';
import 'views/product_list.dart';
import 'views/anime_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //* variabile dark mode
  bool isDarkMode = false;

  //* funzione per cambiare tema
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presto.it',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        /* colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF668968)), */
      ),

      //* pagina iniziale dell'app
      //home: CategoryView(),

      //home: WelcomeView(isDarkMode: isDarkMode, onToggleDarkMode: toggleDarkMode,),

      //* rotta iniziale
      initialRoute: '/welcome',
      //* mappa delle rotte
      routes: {
        '/welcome':(context) => WelcomeView(isDarkMode: isDarkMode, onToggleDarkMode: toggleDarkMode,),
        '/category':(context) => CategoryView(),
        '/product_list': (context) =>
            const ProductList(category: 'Example Category'),
        '/anime_list': (context) => const AnimeList(category: 'Anime'),
      }

    );
  }
}

//! devo correggere un overflow, credo chiederò appuntamento per la prossima settimana se non riesco a risolverlo da sola
