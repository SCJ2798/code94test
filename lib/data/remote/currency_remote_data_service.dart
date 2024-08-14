import 'dart:io';
import 'package:ilabtest/data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:ilabtest/error/comon_error.dart';

class CurrencyRemoteDataService extends BaseApiService {
  @override
  Future<dynamic> getResponse(String url) async {
    try {
      final uri = Uri.parse(baseUrl)
          .replace(queryParameters: {'apikey': apiKey, 'currencies': ''});
      final response = await http.get(uri);
      return returnResponse(response);
    } on SocketException {
      throw CommonError("No Connection Found");
    }
  }

  @override
  Future postResponse(String url, Map<String, String> body) async {
    try {
      final response = await http.post(Uri.parse(baseUrl + url), body: body);
      if (response.statusCode != 200) throw Error();
      return returnResponse(response);
    } on SocketException {
      throw CommonError("No Connection Found");
    }
  }

  @override
  Future getResponseWithQuery(Map<String, dynamic> query) async {
    try {
      final uri = Uri.parse(baseUrl)
          .replace(queryParameters: {'apikey': apiKey, ...query});
      final response = await http.get(uri);
      return returnResponse(response);
    } on SocketException {
      throw CommonError("No Connection Found");
    }
  }
}
