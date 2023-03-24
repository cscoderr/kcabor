import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/features/home/data/remote/popular_food_api.dart';
import 'package:kabor/features/home/domain/repositories/popular_food_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final popularFoodProvider = Provider<PopularFoodRepository>((ref) {
  return PopularFoodRepositoryImpl(
    apiClient: ref.watch(popularFoodApiProvider),
  );
});

class PopularFoodRepositoryImpl extends PopularFoodRepository {
  PopularFoodRepositoryImpl({
    required PopularFoodApiClient apiClient,
  }) : _apiClient = apiClient;

  final PopularFoodApiClient _apiClient;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
    int? offset,
    int? limit,
  }) async {
    final response = await _apiClient.getPopularFoodCategory(
      offset: offset,
      limit: limit,
    );
    return response;
  }
}
