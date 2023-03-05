import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationApiClient {
  AuthenticationApiClient({http.Client? httpClient, String? baseUrl})
      : _httpClient = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? 'https://reqres.in/api/login';

  final http.Client _httpClient;
  final String _baseUrl;

  Future<void> login(
      {required String username, required String password}) async {
    final response = await _httpClient.post(
      Uri.parse(_baseUrl),
      body: json.encode({
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
    } else {}
  }
}
