import 'package:flutter/material.dart';
import 'sign_up_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E1D3),

      // SafeArea evita che il contenuto venga tagliato da notch e bordi.
      body: SafeArea(

        //LOGO
        child: Column(
          children: [
            // Expanded occupa lo spazio disponibile, column e center non andavano bene perché non permettevano di spingere i pulsanti in fondo.

            Expanded(
              child: Center(
                // immagine di sfondo, uso stack come fosse un position relative di CSS
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.25,
                      child: Image.asset(
                        'assets/images/bunny_bkg.png',
                        width: 150,
                      ),
                    ),

                    // se non sta dentro stack l'immagine di sfondo non sarebbe sovrapposta al testo
                    Text.rich(
                      const TextSpan(
                        style: TextStyle(
                          fontFamily: 'DM Serif Display',
                          fontSize: 48,
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
                  ],
                ),
              ),
            ),

            // BUTTONS
            Center(
              child: Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Pulsante Log In
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpView()),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD97841),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 55),
                      ),

                      label: const Text(
                        "Log in",
                        style: TextStyle(fontSize: 20),
                      ),
                      icon: const Icon(Icons.login),
                    ),

                    // Container per separare i pulsanti
                    Container(
                      margin: const EdgeInsets.only(top: 12),

                      // Pulsante Sign Up
                      child: ElevatedButton.icon(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF668968),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(0, 55),
                        ),

                        label: const Text(
                          "Sign up",
                          style: TextStyle(fontSize: 20),
                        ),
                        icon: const Icon(Icons.app_registration),
                      ),
                    ),
                  ],
                ),
              ),
            ), // chiusura del Container
          ],
        ),
      ),
    );
  }
}
