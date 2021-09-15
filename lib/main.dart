import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myanime/providers/data_provider.dart';
import 'package:myanime/screens/anime_details_screen.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          AnimeDetailScreen.routeName: (context) => AnimeDetailScreen(),
        },
      ),
    );
  }
}
