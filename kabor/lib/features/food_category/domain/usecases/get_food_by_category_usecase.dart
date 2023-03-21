import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';

final getFoodCategoryUsecaseProvider =
    Provider<GetFoodByCategoryUsecase>((ref) {
  return GetFoodByCategoryUsecase(ref.watch(foodCategoryProvider));
});

class GetFoodByCategoryUsecase extends Usecases<
    PaginatedResponse<List<ProductResponse>>, GetFoodByCategoryParams> {
  GetFoodByCategoryUsecase(this.repository);

  final FoodCategoryRepository repository;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> call(
    GetFoodByCategoryParams params,
  ) async {
    return repository.getFoodByCategory(
      categoryId: params.categoryId,
      offset: params.offset,
      limit: params.limit,
    );
  }
}

class GetFoodByCategoryParams extends Equatable {
  const GetFoodByCategoryParams({
    required this.categoryId,
    this.offset,
    this.limit,
  });
  final int categoryId;
  final int? offset;
  final int? limit;
  @override
  List<Object?> get props => [categoryId, offset, limit];
}
