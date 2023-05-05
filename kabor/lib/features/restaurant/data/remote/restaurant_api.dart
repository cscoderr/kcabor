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
  Future<PaginatedResponse<List<ProductResponse>>> foodByCategory({
    required String categoryId,
    int? offset,
    int? limit,
  });
}

class RestaurantApiClientImpl extends RestaurantApiClient {
  RestaurantApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<RestaurantResponse> getRestaurantDetails(String restaurantId) async {
    print(restaurantId);
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/restaurants/details/$restaurantId'),
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

  @override
  Future<PaginatedResponse<List<ProductResponse>>> foodByCategory({
    required String categoryId,
    int? offset,
    int? limit,
  }) async {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/food/items/$categoryId').replace(
        queryParameters: {
          if (offset != null) 'offset': offset.toString(),
          if (limit != null) 'limit': limit.toString(),
        },
      ),
    );

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return PaginatedResponse.fromJson(
        data,
        (json) {
          return (json as List)
              .map(
                (e) => ProductResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        },
      );
    } else {
      throw Exception('');
    }
  }
}
