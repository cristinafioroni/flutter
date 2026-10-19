
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:prima_app/models/anime.dart';

class AnimeService {
  static const url = 'https://graphql.anilist.co';

  static Future<List<Anime>> fetchAnimeList() async {
    const query = '''
      query {
        Page(page: 1, perPage: 20) {
          media(type: ANIME, sort: POPULARITY_DESC) {
            title {
              romaji
            }
            description(asHtml: false)
            genres
            coverImage {
              large
            }
          }
        }
      }
    ''';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': query}),
    ).timeout(const Duration(seconds: 15));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final data = responseData['data']['Page']['media'] as List;

      return data
          .map((item) => Anime.fromJson(item))
          .toList();
    } else {
      throw Exception('Errore HTTP ${response.statusCode}');
    }
  }
}
