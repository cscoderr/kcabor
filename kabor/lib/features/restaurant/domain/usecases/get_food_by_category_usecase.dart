import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/restaurant/data/data.dart';
import 'package:kabor/features/restaurant/domain/repositories/restaurant_repository.dart';

final getFoodByCategoryUsecasesProvider =
    Provider<GetFoodByCategoryUsecase>((ref) {
  return GetFoodByCategoryUsecase(ref.watch(restaurantRepositoryProvider));
});

class GetFoodByCategoryUsecase extends Usecases<
    PaginatedResponse<List<ProductResponse>>, GetFoodByCategoryParams> {
  GetFoodByCategoryUsecase(this.repository);
  final RestaurantRepository repository;

  @override
  Future<PaginatedResponse<List<ProductResponse>>> call(
    GetFoodByCategoryParams params,
  ) async {
    return repository.foodByCategory(
      categoryId: params.categoryId,
      offset: params.offset,
      limit: params.limit,
    );
  }
}

class GetFoodByCategoryParams {
  GetFoodByCategoryParams({
    required this.categoryId,
    this.offset,
    this.limit,
  });
  final String categoryId;
  final int? offset;
  final int? limit;
}
