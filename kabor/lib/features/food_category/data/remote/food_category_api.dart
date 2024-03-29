import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/models/category/category.dart';

final foodCategoryApiProvider = Provider<FoodCategoryApiClient>((ref) {
  return FoodCategoryApiClientImpl(httpClient: ref.watch(mainhttpProvider));
});

abstract class FoodCategoryApiClient {
  Future<List<Category>> getCategories();
  Future<PaginatedResponse<List<ProductResponse>>> getFoodByCategory({
    required int categoryId,
    int? offset,
    int? limit,
  });
}

class FoodCategoryApiClientImpl extends FoodCategoryApiClient {
  FoodCategoryApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<List<Category>> getCategories() async {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/food/categories'),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as List;
      return data
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getFoodByCategory({
    required int categoryId,
    int? offset,
    int? limit,
  }) async {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/food/items/$categoryId').replace(
        queryParameters: {
          if (offset != null) 'offset': offset.toString(),
          if (offset != null) 'limit': limit.toString(),
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return PaginatedResponse.fromJson(
        data,
        (json) {
          print(json);
          return (json as List)
              .map(
                (e) => ProductResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        },
      );
    }
    throw Exception('Error fetching food by category');
  }
}
