import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/models/category/category.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/features/food_category/food_category.dart';

final foodCategoryProvider = Provider<FoodCategoryRepository>((ref) {
  return FoodCategoryRepositoryImpl(
    apiClient: ref.watch(foodCategoryApiProvider),
  );
});

class FoodCategoryRepositoryImpl extends FoodCategoryRepository {
  FoodCategoryRepositoryImpl({
    required FoodCategoryApiClient apiClient,
  }) : _apiClient = apiClient;

  final FoodCategoryApiClient _apiClient;

  @override
  Future<List<Category>> getCategories() async {
    try {
      final response = await _apiClient.getCategories();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaginatedResponse<List<ProductResponse>>> getFoodByCategory({
    required int categoryId,
    int? offset,
    int? limit,
  }) async {
    // try {
    final response = await _apiClient.getFoodByCategory(
      categoryId: categoryId,
      offset: offset,
      limit: limit,
    );
    return response;
    // } catch (e) {
    //   rethrow;
    // }
  }
}
