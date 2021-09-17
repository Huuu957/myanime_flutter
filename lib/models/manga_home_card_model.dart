class MangaHomeCardModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;

  MangaHomeCardModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
  });

  factory MangaHomeCardModel.fromJson(Map<String, dynamic> json) {
    return MangaHomeCardModel(
      malId: json['mal_id'],
      url: json['url'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }
}
