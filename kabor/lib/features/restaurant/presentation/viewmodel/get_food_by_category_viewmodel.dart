import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';

typedef GetFoodCategoryResponse
    = AsyncValue<PaginatedResponse<List<ProductResponse>>>;

class GetFoodByCategoryViewModel extends PaginatedProvider<ProductResponse> {
  GetFoodByCategoryViewModel(super.ref);

  Future<void> getFoodByCategory(
    int categoryId, {
    int? offset,
    int? totalSize,
    bool hasLoader = true,
  }) {
    final newOffset = super.getOffset(
      offset: offset,
      totalSize: totalSize,
    );
    return super.onRequest(
      () => ref.read(getFoodCategoryUsecaseProvider).call(
            GetFoodByCategoryParams(
              categoryId: categoryId,
              offset: newOffset,
              limit: AppConstants.appLimit,
            ),
          ),
      offset: newOffset,
      hasLoader: hasLoader,
    );
  }
}

final getFoodCategoryVMProvider =
    StateNotifierProvider<GetFoodByCategoryViewModel, GetFoodCategoryResponse>(
  GetFoodByCategoryViewModel.new,
);
