
class Anime {
  String title;
  String description;
  String genre;
  String imageUrl;

  Anime({
    required this.title,
    required this.description,
    required this.genre,
    required this.imageUrl,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    final title = json['title'] as Map<String, dynamic>;
    final coverImage = json['coverImage'] as Map<String, dynamic>;
    final genres = json['genres'] as List<dynamic>? ?? [];

    return Anime(
      title: title['romaji'] as String? ?? 'Titolo non disponibile',
      description: json['description'] as String? ?? '',
      genre: genres.join(', '),
      imageUrl: coverImage['large'] as String? ?? '',
    );
  }
}
