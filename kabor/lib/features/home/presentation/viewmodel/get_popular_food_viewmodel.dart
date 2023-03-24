import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/configs/app_constants.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/core/providers/paginated_provider.dart';
import 'package:kabor/features/home/domain/usecases/get_popular_food_usecases.dart';

typedef GetPopularFoodResponse
    = AsyncValue<PaginatedResponse<List<ProductResponse>>>;

class GetPopularFoodViewModel extends PaginatedProvider<ProductResponse> {
  GetPopularFoodViewModel(super.ref);

  Future<void> getPopularFood({
    int? offset,
    int? totalSize,
    bool hasLoader = true,
  }) {
    final newOffset = super.getOffset(
      offset: offset,
      totalSize: totalSize,
    );
    return super.onRequest(
      () => ref.read(getPopularFoodUsecaseProvider).call(
            GetPopularFoodParams(
              offset: newOffset,
              limit: AppConstants.appLimit,
            ),
          ),
      offset: newOffset,
      hasLoader: hasLoader,
    );
  }
}

final getPopularFoodVMProvider =
    StateNotifierProvider<GetPopularFoodViewModel, GetPopularFoodResponse>(
  GetPopularFoodViewModel.new,
);
