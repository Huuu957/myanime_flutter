import 'package:flutter/material.dart';
import 'package:myanime/models/home_card_model.dart';
import 'package:myanime/screens/manga_details_screen.dart';

class HomeCard extends StatelessWidget {
  final HomeCardModel homeData;
  final int cardIndex;

  HomeCard({
    required this.homeData,
    this.cardIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    // final device = MediaQuery.of(context);
    // final screenHeight = device.size.height;
    // final screenWidth = device.size.width;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) =>
              new MangaDetailScreen(MangaDetailScreen.mangaRouteName),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: homeData.malId,
                child: Image.network(
                  homeData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    homeData.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: Colors.purpleAccent,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
