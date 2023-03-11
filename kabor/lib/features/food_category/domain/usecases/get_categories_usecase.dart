import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/data/data.dart';
import 'package:kabor/features/food_category/domain/repositories/food_category_repository.dart';

final getCategoriesUsecaseProvider = Provider<GetCategoryUsecase>((ref) {
  return GetCategoryUsecase(ref.watch(foodCategoryProvider));
});

class GetCategoryUsecase extends NoParamsUsecases<List<Category>> {
  GetCategoryUsecase(this.repository);
  final FoodCategoryRepository repository;
  @override
  Future<List<Category>> call() async {
    return repository.getCategories();
  }
}
