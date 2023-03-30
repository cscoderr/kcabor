import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/configs/app_constants.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/core/models/product/product_response.dart';
import 'package:kabor/core/providers/paginated_provider.dart';
import 'package:kabor/features/home/domain/usecases/get_hot_deals_usecase.dart';

typedef GetHotDealsResponse
    = AsyncValue<PaginatedResponse<List<ProductResponse>>>;

class GetHotDealsViewModel extends PaginatedProvider<ProductResponse> {
  GetHotDealsViewModel(super.ref);

  Future<void> getHotDeals({
    String? offset,
    int? totalSize,
    bool hasLoader = true,
  }) {
    final newOffset = super.getOffset(
      offset: offset,
      totalSize: totalSize,
    );
    return super.onRequest(
      () => ref.read(getHotDealsUsecaseProvider).call(
            GetHotDealsParams(
              offset: newOffset,
              limit: AppConstants.appLimit,
            ),
          ),
      offset: newOffset,
      hasLoader: hasLoader,
    );
  }
}

final getHotDealsVMProvider =
    StateNotifierProvider<GetHotDealsViewModel, GetHotDealsResponse>(
  GetHotDealsViewModel.new,
);
