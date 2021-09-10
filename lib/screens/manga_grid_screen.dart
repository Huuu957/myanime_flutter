import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myanime/providers/manga_data_provider.dart';
import 'package:myanime/screens/error_screen.dart';
import 'package:myanime/widgets/home_card.dart';

class MangaGridPage extends StatefulWidget {
  @override
  _MangaGridPageState createState() => _MangaGridPageState();
}

class _MangaGridPageState extends State<MangaGridPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    await Provider.of<MangaDataProvider>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenHeight = device.size.height;
    final screenWidth = device.size.width;

    final homeData = Provider.of<MangaDataProvider>(context);

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: homeData.isError
            ? ErrorScreen(homeData.errorMessage)
            : homeData.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                      strokeWidth: 5,
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: getData,
                    color: Colors.purple,
                    strokeWidth: 2.5,
                    child: LiveGrid.options(
                      padding: EdgeInsets.all(15).copyWith(left: 20, right: 20),
                      options: LiveOptions(
                        showItemInterval: Duration(
                          milliseconds: 100,
                        ),
                      ),
                      itemCount: homeData.searchList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5 / 2.5,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index, animation) =>
                          FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(animation),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, -0.1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: HomeCard(
                            homeData: homeData.searchList[index],
                            cardIndex: index,
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
