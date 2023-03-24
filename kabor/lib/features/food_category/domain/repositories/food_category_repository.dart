import 'package:kabor/core/core.dart';
import 'package:kabor/core/models/category/category.dart';

abstract class FoodCategoryRepository {
  Future<List<Category>> getCategories();
  Future<PaginatedResponse<List<ProductResponse>>> getFoodByCategory({
    required int categoryId,
    int? offset,
    int? limit,
  });
}
