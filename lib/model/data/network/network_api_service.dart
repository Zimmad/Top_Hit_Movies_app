import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import './base_api_service.dart';
import '../responce/api_response.dart';
import '../app_exceptions.dart';

import './network_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String uri) async {
    dynamic apiResponseJson;
    try {
      http.Response response =
          await http.get(Uri.parse(uri)).timeout(const Duration(seconds: 30));
      apiResponseJson = returnResponse(response);
      return apiResponseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic apiResponse;
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 30));
      apiResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return apiResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server. Error Code : ${response.statusCode}');
    }
  }
}
