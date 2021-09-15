import 'package:flutter/material.dart';
import 'package:myanime/models/manga_model.dart';

class MangaDetailsGenres extends StatelessWidget {
  late final MangaModel mangaData;
  MangaDetailsGenres({required this.mangaData});

  Widget moveLabel(String text, dynamic pokeData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 7,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List genreList = mangaData.genres;
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      childAspectRatio: 6 / 1.5,
      crossAxisSpacing: 4,
      children: genreList.map((item) => moveLabel(item, mangaData)).toList(),
    );
  }
}
