import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prueba/src/app/config/api_config.dart';

class ApiService extends ApiConfig {
  final httpClient = http.Client();

  Future<http.Response> getAccessToken({
    required String endPoint,
    String? token,
  }) async {
    headers.addAll({
      "user-email": dotenv.env["USER_EMAIL"] ?? "",
      "api-token": dotenv.env["API_TOKEN"] ?? "",
    });

    final Uri url = Uri.https(baseUrl, endPoint);
    final response = await httpClient.get(url, headers: headers);
    return response;
  }

  Future<http.Response> get({
    required String endPoint,
    String? token,
  }) async {
    _setTokenHeader(token);
    final Uri url = Uri.https(baseUrl, endPoint);
    final response = await httpClient.get(url, headers: headers);
    return response;
  }

  void _setTokenHeader(String? token) {
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
  }
}
