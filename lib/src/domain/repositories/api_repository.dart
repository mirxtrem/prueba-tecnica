import 'dart:convert';

import 'package:prueba/src/data/services/api_service.dart';
import 'package:prueba/src/domain/models/country.dart';

class ApiRepository {
  final ApiService api;

  ApiRepository({required this.api});

  Future<String> getToken() async {
    final response = await api.getAccessToken(endPoint: "api/getaccesstoken");

    if (response.statusCode == 200) {
      final decodedResponse =
          json.decode(response.body) as Map<String, dynamic>;
      return decodedResponse["auth_token"];
    }

    throw Exception("Error al obtener el token, Code: ${response.statusCode}");
  }

  Future<List<Country>> getCountries({required String token}) async {
    final response = await api.get(endPoint: "api/countries/", token: token);

    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body) as List<Map<String, dynamic>>;
      return decodedData.map((c) => Country.fromJson(c)).toList();
    }

    throw Exception("Error al obtener paises, Code: ${response.statusCode}");
  }
}
