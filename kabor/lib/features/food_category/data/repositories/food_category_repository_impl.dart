import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      return await _apiClient.getCategories();
    } catch (e) {
      rethrow;
    }
  }
}
