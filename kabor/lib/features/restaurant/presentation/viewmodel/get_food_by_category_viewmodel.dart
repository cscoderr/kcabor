import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';

typedef GetFoodCategoryResponse
    = AsyncValue<PaginatedResponse<List<ProductResponse>>>;

class GetFoodByCategoryViewModel
    extends StateNotifier<GetFoodCategoryResponse> {
  GetFoodByCategoryViewModel(this.ref) : super(const AsyncValue.loading());

  final Ref ref;

  Future<void> getFoodByCategory({
    required int categoryId,
    int? offset,
    int? limit,
  }) async {
    state = const AsyncValue.loading();
    // try {
    final response = await ref.read(getFoodCategoryUsecaseProvider).call(
          GetFoodByCategoryParams(
            categoryId: categoryId,
            offset: offset,
            limit: limit ?? 20,
          ),
        );
    state = AsyncValue.data(response);
    // } catch (e) {
    //   state = AsyncValue.error(e, StackTrace.current);
    // }
  }
}

final getFoodCategoryVMProvider =
    StateNotifierProvider<GetFoodByCategoryViewModel, GetFoodCategoryResponse>(
  GetFoodByCategoryViewModel.new,
);
