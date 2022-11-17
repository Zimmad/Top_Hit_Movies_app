import 'package:http/http.dart' as http;
import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import 'package:using_mvvm_provider/model/models/MoviesListModel.dart';

import 'package:using_mvvm_provider/resources/app_urls.dart';

class HomeRepositories {
  BaseApiServices apiServices = NetworkApiServices();

  Future<MoviesListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppUrls.moviesListEndPoint);
      // response = MoviesListModel.fromJson(response);

      return MoviesListModel.fromJson(response);
    } catch (e) {
      throw (e);
    }
  }
}
