import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:kabor/core/core.dart';

final homeApiClientProvider = Provider<HomeApiClient>((ref) {
  return HomeApiClientImpl(httpClient: ref.read(mainhttpProvider));
});

abstract class HomeApiClient {
  Future<PaginatedResponse<List<ProductResponse>>> getHotDeals({
    int? offset,
    int? limit,
  });

  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  });
}

class HomeApiClientImpl extends HomeApiClient {
  HomeApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getHotDeals({
    int? offset,
    int? limit,
  }) async {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/food/latest').replace(
        queryParameters: {
          if (offset != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      ),
    );
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
    }
    throw Exception('Error fetching hot deals');
  }

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  }) async {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/food/popular').replace(
        queryParameters: {
          if (offset != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
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
    }
    throw Exception('Error fetching popular foods');
  }
}
