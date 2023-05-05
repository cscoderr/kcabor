import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';
import 'package:kabor/features/menu/payment/domain/usecase/payment_usecase.dart';

import '../../data/models/wallet_response.dart';

typedef GetPaymentResponse
    = AsyncValue<PaginatedResponse<List<WalletResponse>>>;

class GetPaymentViewModel extends PaginatedProvider<WalletResponse> {
  GetPaymentViewModel(super.ref);

  Future<void> getPayment({
    String? offset,
    int? totalSize,
    bool hasLoader = true,
  }) {
    final newOffset = super.getOffset(
      offset: offset,
      totalSize: totalSize,
    );
    return super.onRequest(
      () => ref.read(getPaymentUsecasesProvider).call(
            GetPaymentParams(
              offset: newOffset,
              limit: AppConstants.appLimit,
            ),
          ),
      offset: newOffset,
      hasLoader: hasLoader,
    );
  }
}

final getPaymentVMProvider =
    StateNotifierProvider<GetPaymentViewModel, GetPaymentResponse>(
  GetPaymentViewModel.new,
);
