class MangaModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;
  late String titleEnglish;
  late String synopsis;
  late String status;
  late var chapters;
  late String rating;
  late var score;
  late var rank;
  late String publishing;
  late List genres;
  late var genreId;

  MangaModel({
    this.malId = 0,
    this.url = '',
    this.imageUrl = '',
    this.title = '',
    this.titleEnglish = '',
    this.synopsis = '',
    this.status = '',
    this.chapters = 0,
    this.rating = '',
    this.score = 0,
    this.rank = 0,
    this.publishing = '',
    this.genres = const [],
    this.genreId = 1,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    List genresList = json['genres'];
    List tempGenresList = [];
    for (int i = 0; i < genresList.length; i++) {
      var genres = json['genres'][i]['name'];
      tempGenresList.add(genres);
      // print(tempGenresList);
    }

    return MangaModel(
      malId: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? 'TBA',
      synopsis: json['synopsis'] ?? '',
      status: json['status'] ?? '',
      chapters: json['chapters'] ?? 0,
      rating: json['rating'] ?? '',
      score: json['score'] ?? 0,
      rank: json['rank'] ?? 0,
      publishing: json['published']['string'] ?? '',
      genres: tempGenresList,
      genreId: json['genres'][0]['mal_id'],
    );
  }
}
