import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/restaurant/restaurant.dart';

typedef FoodByCategory = PaginatedResponse<List<ProductResponse>>;

class FoodByCategoryNotifier extends StateNotifier<AsyncValue<FoodByCategory>> {
  FoodByCategoryNotifier(this.ref) : super(const AsyncValue.loading());
  final Ref ref;

  Future<void> getFoodByCategory({
    required String categoryId,
    int offset = 0,
    int limit = 20,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ref.read(getFoodByCategoryUsecasesProvider)(
        GetFoodByCategoryParams(
          categoryId: categoryId,
          offset: offset,
          limit: limit,
        ),
      );
      state = AsyncValue.data(result);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final foodByCategoryProvider =
    StateNotifierProvider<FoodByCategoryNotifier, AsyncValue<FoodByCategory>>(
  FoodByCategoryNotifier.new,
);
