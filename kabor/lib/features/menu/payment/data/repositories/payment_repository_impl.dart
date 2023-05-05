import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/features/menu/payment/data/models/wallet_response.dart';
import 'package:kabor/features/menu/payment/payment.dart';

import '../remote/payment_api.dart';

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepositoryImpl(
    paymentApiClient: ref.watch(paymentsApiProvider),
  );
});

class PaymentRepositoryImpl extends PaymentRepository {
  PaymentRepositoryImpl({
    required PaymentApiClient paymentApiClient,
  }) : _paymentApiClient = paymentApiClient;

  final PaymentApiClient _paymentApiClient;

  @override
  Future<PaginatedResponse<List<WalletResponse>>> getPayment({
    int? offset,
    int? limit,
  }) async {
    return _paymentApiClient.getPayment(
      offset: offset,
      limit: limit,
    );
  }
}
