import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myanime/models/anime_model.dart';
import 'package:myanime/models/home_card_model.dart';
import 'package:myanime/models/recommendation_model.dart';
import 'package:myanime/models/manga_model.dart';

class DataProvider with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String errorMessage = '';
  List<HomeCardModel> searchList = [];
  List<RecommendationModel> recommendationList = [];
  late int genreId;
  late AnimeModel animeData = AnimeModel();
  late MangaModel mangaData = MangaModel();

  Future<void> getAnimeHomeData({String category = 'airing'}) async {
    final String url = 'https://api.jikan.moe/v3/top/anime/1';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['top'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print(searchList.length);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchData(String query) async {
    final String url =
        'https://api.jikan.moe/v3/search/anime?q=$query&page=1&limit=12';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<HomeCardModel> tempData = [];
      List items = response.data['results'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAnimeData(int malId) async {
    print('caught anime data');
    final String url = 'https://api.jikan.moe/v3/anime/$malId';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      animeData = AnimeModel.fromJson(response.data);
      await getAnimeRecommendationData(animeData.genreId);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAnimeRecommendationData(int genreId) async {
    final String url = 'https://api.jikan.moe/v3/genre/anime/$genreId/1';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<RecommendationModel> tempRecommendation = [];
      List items = response.data['anime'];
      tempRecommendation = items
          .map((data) => RecommendationModel.fromJson(data))
          .take(5)
          .toList();
      recommendationList = tempRecommendation;
      for (var i = 0; i != recommendationList.length; i++) {
        print(recommendationList[i].title);
      }
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
  //TODO: ADD MANGA DATA HERE------------------------------------------------------------------------------

  Future<void> getMangaHomeData({String category = 'airing'}) async {
    final String mangaUrl = 'https://api.jikan.moe/v3/top/manga/1';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(mangaUrl);
      List<HomeCardModel> tempData = [];
      List items = response.data['top'];
      tempData = items.map((data) => HomeCardModel.fromJson(data)).toList();
      searchList = tempData;
      print(searchList.length);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMangaData(int malId) async {
    print('caught manga data');
    final String mangaUrl = 'https://api.jikan.moe/v3/manga/$malId';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(mangaUrl);
      mangaData = MangaModel.fromJson(response.data);
      await getMangaRecommendationData(mangaData.genreId);
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;

        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMangaRecommendationData(int genreId) async {
    final String url = 'https://api.jikan.moe/v3/genre/manga/$genreId/1';
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<RecommendationModel> tempRecommendation = [];
      List items = response.data['manga'];
      tempRecommendation = items
          .map((data) => RecommendationModel.fromJson(data))
          .take(5)
          .toList();
      recommendationList = tempRecommendation;
      for (var i = 0; i != recommendationList.length; i++) {
        print(recommendationList[i].title);
      }
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.other) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
