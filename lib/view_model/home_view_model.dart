import 'package:flutter/cupertino.dart';
import '../model/data/responce/api_response.dart';
import '../model/models/MoviesListModel.dart';
import '../model/repositories/home_reposiories.dart';

class HomeViewModel with ChangeNotifier {
  final _homeScreenRep = HomeRepositories();
  ApiResponse<MoviesListModel> movieList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> responseMoviesList) {
    movieList = responseMoviesList;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _homeScreenRep.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
