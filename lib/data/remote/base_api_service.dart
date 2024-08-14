import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilabtest/error/http_respose_error.dart';

abstract class BaseApiService {
  final String baseUrl = "https://api.freecurrencyapi.com/v1/latest";
  final String apiKey = "fca_live_xjw1dYBOBHQU6cR2ouKs6sao4v06Rdpq8lp4ptIA";

  Future<dynamic> getResponse(String url);
  Future<dynamic> getResponseWithQuery(Map<String, dynamic> query);
  Future<dynamic> postResponse(String url, Map<String, String> body);

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw HttpResponseError(400, response.body.toString());
      case 401:
        throw HttpResponseError(401, response.body.toString());
      case 403:
        throw HttpResponseError(403, response.body.toString());
      case 404:
        throw HttpResponseError(401, response.body.toString());
      case 500:
      default:
        throw HttpResponseError(
            500,
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
