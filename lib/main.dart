import 'package:flutter/material.dart';
import 'package:prima_app/sign_up_view.dart';
import 'welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return MaterialApp(
      title: 'Presto.it',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        /* colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF668968)), */
      ),

      home: const WelcomeView(),
    );
  }
}


//! devo correggere un overflow, credo chiederò appuntamento per la prossima settimana se non riesco a risolverlo da sola