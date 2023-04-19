import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/features/home/data/data.dart';
import 'package:kabor/features/home/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    apiClient: ref.watch(homeApiClientProvider),
  );
});

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required HomeApiClient apiClient,
  }) : _apiClient = apiClient;

  final HomeApiClient _apiClient;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getHotDeals({
    int? offset,
    int? limit,
  }) async {
    final response = await _apiClient.getHotDeals(
      offset: offset,
      limit: limit,
    );
    return response;
  }

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getPopularFood({
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
