import 'package:kabor/features/food_category/food_category.dart';

abstract class FoodCategoryRepository {
  Future<List<Category>> getCategories();
}
