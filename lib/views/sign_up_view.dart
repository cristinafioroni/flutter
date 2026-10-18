
import 'package:flutter/material.dart';
import 'category_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  final bool isDarkMode;
  final VoidCallback onToggleDarkMode;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFE9E1D3),
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

      body: SafeArea(

        child: LayoutBuilder(
          builder: (context, constraints) {

            // Ho messo delle variabili altrimenti non sapevo come gestire le dimensioni dei vari elementi
            double logoSize;
            double bunnySize;
            double loginWidth;
            double loginHeight;
            double inputFontSize;

            // final constraints = MediaQuery.of(context).size;

            if (constraints.maxWidth < 600) {

              // Smartphone
              logoSize = 36;
              bunnySize = 100;
              loginWidth = 350;
              loginHeight = 300;
              inputFontSize = 16;

            } else {

              // Tablet e PC
              logoSize = 48;
              bunnySize = 150;
              loginWidth = 500;
              loginHeight = 400;
              inputFontSize = 20;
            }

            //LOGO
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Opacity(
                              opacity: 0.25,
                              child: Image.asset(
                                'assets/images/bunny_bkg.png',
                                width: bunnySize,
                              ),
                            ),

                            // se non sta dentro stack l'immagine di sfondo non sarebbe sovrapposta al testo
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'DM Serif Display',
                                  fontSize: logoSize,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: const [
                                  TextSpan(
                                    text: "Presto.",
                                    style: TextStyle(
                                      color: Color(0xFF668968),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "it",
                                    style: TextStyle(
                                      color: Color(0xFFD97841),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // LOG IN BOX
                        Container(
                          width: loginWidth,
                          height: loginHeight,
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(20),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [
                              // campo username
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(
                                      255, 162, 180, 162,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Row(
                                  children: [
                                    const Opacity(
                                      opacity: 0.7,
                                      child: Icon(
                                        Icons.person,
                                        color: Color(0xFF668968),
                                      ),
                                    ),
                                    Text(
                                      " Username",
                                      style: TextStyle(
                                        color: const Color(0xFF668968),
                                        fontSize: inputFontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // campo password
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(
                                      255, 162, 180, 162,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Row(
                                  children: [
                                    const Opacity(
                                      opacity: 0.7,
                                      child: Icon(
                                        Icons.lock,
                                        color: Color(0xFF668968),
                                      ),
                                    ),
                                    Text(
                                      " Password",
                                      style: TextStyle(
                                        color: const Color(0xFF668968),
                                        fontSize: inputFontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Pulsante Log In
                              ElevatedButton.icon(
                                onPressed: () {},

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD97841),
                                  foregroundColor: Colors.white,
                                ),

                                label: const Text(
                                  "Log in",
                                  style: TextStyle(fontSize: 18),
                                ),

                                icon: const Icon(Icons.login),
                              ),

                              // Container per separare il testo dal pulsante
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 15),

                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontSize: inputFontSize,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: "Non hai un account? ",
                                      ),
                                      TextSpan(
                                        text: "Registrati",
                                        style: TextStyle(
                                          color: Color(0xFF668968),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
