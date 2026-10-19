
import 'package:flutter/material.dart';
import 'package:prima_app/models/anime.dart';
import 'package:prima_app/services/anime_service.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({super.key, required this.category});

  final String category;

  @override
  State<AnimeList> createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  //* Funzione per caricare i prodotti dal file JSON
  late Future<List<Anime>> futureAnimes;

  @override
  void initState() {
    super.initState();
    futureAnimes = AnimeService.fetchAnimeList();
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
              widget.category,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF668968),
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Anime>>(
              future: futureAnimes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Impossibile caricare gli anime.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${snapshot.error}',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                futureAnimes = AnimeService.fetchAnimeList();
                              });
                            },
                            child: const Text('Riprova'),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("Nessun prodotto disponibile"));
                }

                //* lista dei prodotti

                List<Anime> animes = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: animes.length,
                  itemBuilder: (context, index) {
                    return Card.filled(
                      elevation: 5,
                      color: const Color(0xFFE9E1D3),
                      child: SizedBox(
                        height: 150,
                        child: Row(
                          children: [
                            //* ClipRRect è un widget che serve per arrotondare gli angoli di un widget figlio, in questo caso l'immagine del prodotto.
                            //* avvolge image.network per arrotondare gli angoli superiori dell'immagine (pensavo esistesse un top generico, ma mi sa di no)

                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              child: Image.network(
                                animes[index].imageUrl,
                                fit: BoxFit.cover,
                                width: 110,
                                height: 150,
                                errorBuilder: (context, error, stackTrace) =>
                                    const SizedBox(
                                      width: 110,
                                      child: Center(
                                        child: Icon(Icons.broken_image_outlined),
                                      ),
                                    ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      animes[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF668968),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      animes[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF668968),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
