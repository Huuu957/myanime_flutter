import 'package:flutter/material.dart';
import 'package:myanime/screens/anime_grid_screen.dart';
import 'package:myanime/constants/constants.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:myanime/providers/data_provider.dart';
import 'package:myanime/screens/manga_grid_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int selectedIndex = 0;

  Future<void> getData(String category) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getHomeData(category: category);
  }

  void searchData(String query) {
    Provider.of<DataProvider>(context, listen: false).searchData(query);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: FloatingSearchAppBar(
          colorOnScroll: Colors.white,
          liftOnScrollElevation: 0,
          elevation: 0,
          hideKeyboardOnDownScroll: true,
          title: Container(
            child: Text(
              'Browse Anime',
              style: kTitleTextStyle,
            ),
          ),
          hint: 'Search anime or manga',
          iconColor: Colors.purple,
          autocorrect: false,
          onFocusChanged: (isFocused) {
            if (!isFocused) {
              setState(() {
                getData('airing');
              });
            }
          },
          onSubmitted: (query) {
            setState(() {
              selectedIndex = 0;
              searchData(query);
            });
          },
          body: TabBarView(
            children: [
              SafeArea(child: AnimeGridPage()),
              SafeArea(child: MangaGridPage()),
            ],
          ),
        ),
      ),
    );
  }
}
