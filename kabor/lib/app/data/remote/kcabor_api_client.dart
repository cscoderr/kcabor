import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kabor/core/core.dart';

final kcaborApiClientProvider = Provider<KcaborApiClient>((ref) {
  return KcaborApiClientImpl();
});

abstract class KcaborApiClient {
  Future<List<dynamic>> getCategories();

  Future<ZoneModel> getZoneId({
    required double latitude,
    required double longitude,
  });
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

  @override
  Future<ZoneModel> getZoneId({
    required double latitude,
    required double longitude,
  }) async {
    print(latitude.toString());
    print(longitude.toString());
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/config/get-zone-id').replace(
        queryParameters: {
          'lat': latitude.toString(),
          'lng': longitude.toString(),
        },
      ),
    );

    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final zoneData = body['zone_data'] as Map<String, dynamic>;
      return ZoneModel.fromJson(zoneData);
    } else {
      throw Exception('Failed to get zone id');
    }
  }
}
