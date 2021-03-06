import 'package:myanime/models/anime_model.dart';
import 'package:myanime/providers/data_provider.dart';
import 'package:myanime/widgets/anime_details_genres.dart';
import 'package:myanime/widgets/anime_details_header.dart';
import 'package:myanime/widgets/recommendation_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeDetailScreen extends StatefulWidget {
  static const routeName = '/animedetailscreen';

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  var _isInit = true;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      late int animeId = ModalRoute.of(context)!.settings.arguments as int;
      Provider.of<DataProvider>(context, listen: false).getAnimeData(animeId);
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final AnimeModel animeData = dataProvider.animeData;
    final device = MediaQuery.of(context);
    // final screenHeight = device.size.height;
    final screenWidth = device.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.purple,
      body: !dataProvider.isLoading
          ? Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenWidth / 1.3,
                    width: screenWidth,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.multiply),
                      child: Hero(
                        tag: animeData.malId,
                        child: Image.network(
                          animeData.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    color: Colors.purple,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: screenWidth / 1.5),
                    clipBehavior: Clip.none,
                    child: Container(
                      width: screenWidth,
                      // padding: EdgeInsets.all(25).copyWith(top: 35),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25)
                                .copyWith(top: 25),
                            child: AnimeDetailsHeader(
                              animeData: animeData,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25)
                                .copyWith(top: 25),
                            child: Text(
                              animeData.synopsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: AnimeDetailsGenres(animeData: animeData),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: const Text(
                              'Animes Like This',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            height: screenWidth / 2,
                            width: screenWidth,
                            margin: EdgeInsets.symmetric(vertical: 15)
                                .copyWith(bottom: 35),
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: dataProvider.recommendationList.length,
                              itemBuilder: (context, index) =>
                                  RecommendationCard(
                                recData: dataProvider.recommendationList[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 5,
            )),
    );
  }
}
