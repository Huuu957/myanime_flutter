import 'package:flutter/material.dart';
import 'package:myanime/models/manga_model.dart';

class MangaDetailsHeader extends StatelessWidget {
  late final MangaModel mangaData;
  MangaDetailsHeader({required this.mangaData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mangaData.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.5),
                Text(
                  mangaData.titleEnglish,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  mangaData.publishing,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  mangaData.rating,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  mangaData.chapters <= 0
                      ? 'Ongoing'
                      : mangaData.chapters.toString() + ' Chapters',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '${mangaData.score}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                    backgroundColor: Colors.grey.withOpacity(.35),
                    strokeWidth: 6.0,
                    value: mangaData.score / 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                mangaData.rank != 0
                    ? 'Ranked\n #${mangaData.rank}'
                    : 'Ranked\n N/A',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
