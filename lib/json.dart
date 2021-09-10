// To parse this JSON data, do
//
//     final animeDetailsResponse = animeDetailsResponseFromMap(jsonString);

// To parse this JSON data, do
//
//     final animeDetailsResponse = animeDetailsResponseFromMap(jsonString);

import 'dart:convert';

AnimeDetailsResponse animeDetailsResponseFromMap(String str) =>
    AnimeDetailsResponse.fromMap(json.decode(str));

String animeDetailsResponseToMap(AnimeDetailsResponse data) =>
    json.encode(data.toMap());

class AnimeDetailsResponse {
  AnimeDetailsResponse({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.malId,
    this.url,
    this.imageUrl,
    this.trailerUrl,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.premiered,
    this.broadcast,
    this.related,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.openingThemes,
    this.endingThemes,
  });

  String? requestHash;
  bool? requestCached;
  int? requestCacheExpiry;
  int? malId;
  String? url;
  String? imageUrl;
  String? trailerUrl;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<dynamic>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? premiered;
  String? broadcast;
  Related? related;
  List<Genre>? producers;
  List<Genre>? licensors;
  List<Genre>? studios;
  List<Genre>? genres;
  List<String>? openingThemes;
  List<String>? endingThemes;

  factory AnimeDetailsResponse.fromMap(Map<String, dynamic> json) =>
      AnimeDetailsResponse(
        requestHash: json["request_hash"] == null ? null : json["request_hash"],
        requestCached:
            json["request_cached"] == null ? null : json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"] == null
            ? null
            : json["request_cache_expiry"],
        malId: json["mal_id"] == null ? null : json["mal_id"],
        url: json["url"] == null ? null : json["url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        trailerUrl: json["trailer_url"] == null ? null : json["trailer_url"],
        title: json["title"] == null ? null : json["title"],
        titleEnglish:
            json["title_english"] == null ? null : json["title_english"],
        titleJapanese:
            json["title_japanese"] == null ? null : json["title_japanese"],
        titleSynonyms: json["title_synonyms"] == null
            ? null
            : List<dynamic>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"] == null ? null : json["type"],
        source: json["source"] == null ? null : json["source"],
        episodes: json["episodes"] == null ? null : json["episodes"],
        status: json["status"] == null ? null : json["status"],
        airing: json["airing"] == null ? null : json["airing"],
        aired: json["aired"] == null ? null : Aired.fromMap(json["aired"]),
        duration: json["duration"] == null ? null : json["duration"],
        rating: json["rating"] == null ? null : json["rating"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        scoredBy: json["scored_by"] == null ? null : json["scored_by"],
        rank: json["rank"] == null ? null : json["rank"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        members: json["members"] == null ? null : json["members"],
        favorites: json["favorites"] == null ? null : json["favorites"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        background: json["background"] == null ? null : json["background"],
        premiered: json["premiered"] == null ? null : json["premiered"],
        broadcast: json["broadcast"] == null ? null : json["broadcast"],
        related:
            json["related"] == null ? null : Related.fromMap(json["related"]),
        producers: json["producers"] == null
            ? null
            : List<Genre>.from(json["producers"].map((x) => Genre.fromMap(x))),
        licensors: json["licensors"] == null
            ? null
            : List<Genre>.from(json["licensors"].map((x) => Genre.fromMap(x))),
        studios: json["studios"] == null
            ? null
            : List<Genre>.from(json["studios"].map((x) => Genre.fromMap(x))),
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        openingThemes: json["opening_themes"] == null
            ? null
            : List<String>.from(json["opening_themes"].map((x) => x)),
        endingThemes: json["ending_themes"] == null
            ? null
            : List<String>.from(json["ending_themes"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "request_hash": requestHash == null ? null : requestHash,
        "request_cached": requestCached == null ? null : requestCached,
        "request_cache_expiry":
            requestCacheExpiry == null ? null : requestCacheExpiry,
        "mal_id": malId == null ? null : malId,
        "url": url == null ? null : url,
        "image_url": imageUrl == null ? null : imageUrl,
        "trailer_url": trailerUrl == null ? null : trailerUrl,
        "title": title == null ? null : title,
        "title_english": titleEnglish == null ? null : titleEnglish,
        "title_japanese": titleJapanese == null ? null : titleJapanese,
        "title_synonyms": titleSynonyms == null
            ? null
            : List<dynamic>.from(titleSynonyms!.map((x) => x)),
        "type": type == null ? null : type,
        "source": source == null ? null : source,
        "episodes": episodes == null ? null : episodes,
        "status": status == null ? null : status,
        "airing": airing == null ? null : airing,
        "aired": aired == null ? null : aired!.toMap(),
        "duration": duration == null ? null : duration,
        "rating": rating == null ? null : rating,
        "score": score == null ? null : score,
        "scored_by": scoredBy == null ? null : scoredBy,
        "rank": rank == null ? null : rank,
        "popularity": popularity == null ? null : popularity,
        "members": members == null ? null : members,
        "favorites": favorites == null ? null : favorites,
        "synopsis": synopsis == null ? null : synopsis,
        "background": background == null ? null : background,
        "premiered": premiered == null ? null : premiered,
        "broadcast": broadcast == null ? null : broadcast,
        "related": related == null ? null : related?.toMap(),
        "producers": producers == null
            ? null
            : List<dynamic>.from(producers!.map((x) => x.toMap())),
        "licensors": licensors == null
            ? null
            : List<dynamic>.from(licensors!.map((x) => x.toMap())),
        "studios": studios == null
            ? null
            : List<dynamic>.from(studios!.map((x) => x.toMap())),
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toMap())),
        "opening_themes": openingThemes == null
            ? null
            : List<dynamic>.from(openingThemes!.map((x) => x)),
        "ending_themes": endingThemes == null
            ? null
            : List<dynamic>.from(endingThemes!.map((x) => x)),
      };
}

class Aired {
  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  DateTime? from;
  DateTime? to;
  Prop? prop;
  String? string;

  factory Aired.fromMap(Map<String, dynamic> json) => Aired(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        prop: json["prop"] == null ? null : Prop.fromMap(json["prop"]),
        string: json["string"] == null ? null : json["string"],
      );

  Map<String, dynamic> toMap() => {
        "from": from == null ? null : from!.toIso8601String(),
        "to": to == null ? null : to!.toIso8601String(),
        "prop": prop == null ? null : prop!.toMap(),
        "string": string == null ? null : string!,
      };
}

class Prop {
  Prop({
    this.from,
    this.to,
  });

  From? from;
  From? to;

  factory Prop.fromMap(Map<String, dynamic> json) => Prop(
        from: json["from"] == null ? null : From.fromMap(json["from"]),
        to: json["to"] == null ? null : From.fromMap(json["to"]),
      );

  Map<String, dynamic> toMap() => {
        "from": from == null ? null : from!.toMap(),
        "to": to == null ? null : to!.toMap(),
      };
}

class From {
  From({
    this.day,
    this.month,
    this.year,
  });

  int? day;
  int? month;
  int? year;

  factory From.fromMap(Map<String, dynamic> json) => From(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toMap() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
      };
}

class Genre {
  Genre({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  int? malId;
  Type? type;
  String? name;
  String? url;

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        malId: json["mal_id"] == null ? null : json["mal_id"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "mal_id": malId == null ? null : malId,
        "type": type == null ? null : typeValues.reverse[type],
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

enum Type { ANIME, MANGA }

final typeValues = EnumValues({"anime": Type.ANIME, "manga": Type.MANGA});

class Related {
  Related({
    this.adaptation,
    this.sideStory,
    this.summary,
  });

  List<Genre>? adaptation;
  List<Genre>? sideStory;
  List<Genre>? summary;

  factory Related.fromMap(Map<String, dynamic> json) => Related(
        adaptation: json["Adaptation"] == null
            ? null
            : List<Genre>.from(json["Adaptation"].map((x) => Genre.fromMap(x))),
        sideStory: json["Side story"] == null
            ? null
            : List<Genre>.from(json["Side story"].map((x) => Genre.fromMap(x))),
        summary: json["Summary"] == null
            ? null
            : List<Genre>.from(json["Summary"].map((x) => Genre.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Adaptation": adaptation == null
            ? null
            : List<dynamic>.from(adaptation!.map((x) => x.toMap())),
        "Side story": sideStory == null
            ? null
            : List<dynamic>.from(sideStory!.map((x) => x.toMap())),
        "Summary": summary == null
            ? null
            : List<dynamic>.from(summary!.map((x) => x.toMap())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
