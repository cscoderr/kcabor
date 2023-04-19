import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http/http.dart';
import 'package:kabor/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final restaurantApiProvider = Provider<RestaurantApiClient>((ref) {
  return RestaurantApiClientImpl(httpClient: ref.watch(mainhttpProvider));
});

abstract class RestaurantApiClient {
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId);
  Future<void> restaurantsByCategory(String categoryId);
}

class RestaurantApiClientImpl extends RestaurantApiClient {
  RestaurantApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId) async {
    final response = await _httpClient.get(
      '${AppConstants.baseUrl}/restaurant/details/$restaurantId',
    );

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return RestaurantResponse.fromJson(data);
    } else {
      throw Exception('');
    }
  }

  @override
  Future<void> restaurantsByCategory(String categoryId) {
    // TODO: implement restaurantsByCategory
    throw UnimplementedError();
  }
}
