import 'package:flutter/material.dart';
import 'sign_up_view.dart';
import 'category_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  final bool isDarkMode;
  final VoidCallback onToggleDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //* floating action button location
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,

      //* Pulsanti Home e Dark/Light Mode
      floatingActionButton: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //* Pulsante per aprire Home

            FloatingActionButton(
              heroTag: 'categoryButton',
              onPressed: () {
                Navigator.pushNamed(context, '/category');
              },
              backgroundColor: isDarkMode
                  ? const Color(0xFF668968)
                  : const Color(0xFF3A4A3B),
              foregroundColor: Colors.white,
              child: Icon(Icons.home),
            ),

            //* Pulsante per cambiare tema (dark/light)
            FloatingActionButton(
              heroTag: 'themeButton',
              onPressed: () {
                onToggleDarkMode();
              },
              backgroundColor: isDarkMode
                  ? const Color(0xFF668968)
                  : const Color(0xFF3A4A3B),
              foregroundColor: Colors.white,
              child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            ),
          ],
        ),
      ),

      backgroundColor: isDarkMode
          ? const Color.fromARGB(255, 37, 48, 38)
          : const Color(0xFFE9E1D3),

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
                      opacity: isDarkMode ? 1 : 0.25,
                      child: Image.asset(
                        isDarkMode
                            ? 'assets/images/bunny_bkg_light.png'
                            : 'assets/images/bunny_bkg.png',
                        width: 200,
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
                          MaterialPageRoute(builder: (context) => SignUpView(
                            isDarkMode: isDarkMode,
                            onToggleDarkMode: onToggleDarkMode,
                          )),
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
