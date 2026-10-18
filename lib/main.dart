import 'package:flutter/material.dart';
import 'package:prima_app/sign_up_view.dart';
import 'welcome_view.dart';
import 'category_view.dart';
import 'views/product_list.dart';

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
      home: CategoryView(),

      /*       home: WelcomeView(
        isDarkMode: isDarkMode,
        onToggleDarkMode: toggleDarkMode,
      ), */
    );
  }
}

//! devo correggere un overflow, credo chiederò appuntamento per la prossima settimana se non riesco a risolverlo da sola
