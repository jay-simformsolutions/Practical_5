import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/network/dio/dio_singleton.dart';

import '../model/tmdb_model.dart';

part 'tmdb_dio_store.g.dart';

class TMDBDioStore = _TMDBDioStore with _$TMDBDioStore;

abstract class _TMDBDioStore with Store {
  _TMDBDioStore() {
    dioGetMockData();
    getFavouriteList();
  }

  @observable
  List<TMDBModel> dioSearchResult = [];

  @observable
  List<TMDBModel> dioMockDataResult = [];

  TextEditingController searchQuery = TextEditingController();

  @observable
  List<TMDBModel> favouriteMovieList = [];

  Future<List<TMDBModel>> dioGetMockData() async {
    try {
      Response response = await SingletonDio().getDio.get('tmdb_movies');
      if (response.statusCode == 200) {
        var jsonData = response.data;
        dioMockDataResult =
            jsonData.map<TMDBModel>((e) => TMDBModel.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
    return dioMockDataResult;
  }

  Future<List<TMDBModel>> searchMovies(String query) async {
    try {
      Response response = await SingletonDio()
          .getDio
          .get('tmdb_movies', queryParameters: {'title': query});
      if (response.statusCode == 200) {
        var searchJsonData = response.data;
        dioSearchResult = searchJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
        debugPrint('Search Result is $dioSearchResult');
      }
    } catch (e) {
      debugPrint('Error Occured at $e');
    }
    return dioSearchResult;
  }

  /// Check During Add Favourite Movies
  void favouriteMovie(TMDBModel model) async {
    await getFavouriteList().then((value) => favouriteMovieList);
    bool flag = false;
    print('favouriteMovieList $favouriteMovieList');
    if (favouriteMovieList.isEmpty) {
      getFavouriteList();
      print('ADD AND ID : ${model.id}');
      await addToFavouriteMovie(model);
    } else {
      for (var value in favouriteMovieList) {
        // debugPrint('value to be check is ${value.title}');
        if (value.title == model.title) {
          // favouriteMovieList.remove(model);
          // print('Delete AND ID : ${model.id}');
          // deleteFavouriteMovies(model.id!);
          flag = true;
          break;
        }
      }
      if (!flag) {
        getFavouriteList();
        addToFavouriteMovie(model);
      }
    }
  }

  /// Related to Favourite Section Network Call

  Future<List<TMDBModel>> getFavouriteList() async {
    try {
      Response response = await SingletonDio().getDio.get('favourite_movies');

      if (response.statusCode == 200) {
        var favouriteJsonData = response.data;
        favouriteMovieList = favouriteJsonData
            .map<TMDBModel>((e) => TMDBModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint('Error at $e');
    }

    return favouriteMovieList;
  }

  Future addToFavouriteMovie(TMDBModel tmdbModel) async {
    print(tmdbModel.id);
    try {
      Response response = await SingletonDio().getDio.post(
            '/favourite_movies',
            data: tmdbModel.toJson(),
          );
      if (response.statusCode == 201) {
        debugPrint('Favourite List is $favouriteMovieList');
        debugPrint('${tmdbModel.title} is successfully added in list');
      } else {
        debugPrint('Something is wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteFavouriteMovies(String id) async {
    print('id $id');
    try {
      Response response =
          await SingletonDio().getDio.delete('favourite_movies/$id');
      if (response.statusCode == 200) {
        debugPrint('Movie deleted from favourite list');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
