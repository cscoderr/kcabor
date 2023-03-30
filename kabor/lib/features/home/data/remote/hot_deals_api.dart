import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http/http.dart';
import 'package:kabor/core/configs/app_constants.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/core/utils/main_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final hotDealsApiProvider = Provider<HotDealsApiClient>((ref) {
  return HotDealsApiClientImpl(httpClient: ref.watch(mainhttpProvider));
});

abstract class HotDealsApiClient {
  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  });
}

class HotDealsApiClientImpl extends HotDealsApiClient {
  HotDealsApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  }) async {
    // try {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/food/latest').replace(
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
    throw Exception('Error fetching hot deals');
  }
  // catch (e) {
  //   print(e);
  //   throw Exception('Error fetching popular foods');
  // }
  // }
}
