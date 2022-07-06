import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../app/config/api_config.dart';

class ApiService extends ApiConfig {
  final httpClient = http.Client();

  Future<http.Response> getAccessToken({
    required String endPoint,
    String? token,
  }) async {
    final headers = {
      "Accept": "application/json",
      "user-email": dotenv.env["USER_EMAIL"] ?? "",
      "api-token": dotenv.env["API_TOKEN"] ?? "",
    };

    final Uri url = Uri.https(baseUrl, endPoint);
    final response = await httpClient.get(url, headers: headers);
    return response;
  }

  Future<http.Response> get({
    required String endPoint,
    String? token,
  }) async {
    final tokenHeader = _setTokenHeader(token);
    final Uri url = Uri.https(baseUrl, endPoint);
    final response = await httpClient.get(url, headers: tokenHeader);
    return response;
  }

  Map<String, String>? _setTokenHeader(String? token) {
    Map<String, String>? tokenHeader;
    if (token != null) {
      tokenHeader = {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
    }
    return tokenHeader;
  }
}
