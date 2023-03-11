import 'package:http/http.dart' as http;

abstract class KcaborApiClient {
  Future<List<dynamic>> getCategories();
}

class KcaborApiClientImpl implements KcaborApiClient {
  KcaborApiClientImpl({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<List<dynamic>> getCategories() async {
    final response = await _httpClient.get(Uri.parse('/food/categories'));
    return [];
  }
}
