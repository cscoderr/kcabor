import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/features/home/data/remote/hot_deals_api.dart';
import 'package:kabor/features/home/domain/repositories/hot_deals_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final hotDealsProvider = Provider<HotDealsRepository>((ref) {
  return HotDealsRepositoryImpl(
    apiClient: ref.watch(hotDealsApiProvider),
  );
});

class HotDealsRepositoryImpl extends HotDealsRepository {
  HotDealsRepositoryImpl({
    required HotDealsApiClient apiClient,
  }) : _apiClient = apiClient;

  final HotDealsApiClient _apiClient;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getHotDeals({
    int? offset,
    int? limit,
  }) async {
    final response = await _apiClient.getPopularFood(
      offset: offset,
      limit: limit,
    );
    return response;
  }
}
