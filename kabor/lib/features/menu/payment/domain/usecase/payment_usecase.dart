import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/payment/data/repositories/payment_repository_impl.dart';
import 'package:kabor/features/restaurant/data/data.dart';
import 'package:kabor/features/restaurant/domain/repositories/restaurant_repository.dart';

import '../../data/models/wallet_response.dart';
import '../repositories/payment_repository.dart';

final getPaymentUsecasesProvider = Provider<GetPaymentUsecase>((ref) {
  return GetPaymentUsecase(ref.watch(paymentRepositoryProvider));
});

class GetPaymentUsecase extends Usecases<
    PaginatedResponse<List<WalletResponse>>, GetPaymentParams> {
  GetPaymentUsecase(this.repository);
  final PaymentRepository repository;

  @override
  Future<PaginatedResponse<List<WalletResponse>>> call(
    GetPaymentParams params,
  ) async {
    return repository.getPayment(
      offset: params.offset,
      limit: params.limit,
    );
  }
}

class GetPaymentParams {
  GetPaymentParams({
    this.offset,
    this.limit,
  });
  final int? offset;
  final int? limit;
}
