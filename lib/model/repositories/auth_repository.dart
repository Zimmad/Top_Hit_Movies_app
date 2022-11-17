import 'package:http/http.dart';
import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';

import 'package:using_mvvm_provider/resources/app_urls.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();
  Future loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrls.loginEndPoint, data);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future signUpApi(data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrls.regesterEndPoint, data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
