// ignore_for_file: one_member_abstracts

import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/payment/data/models/wallet_response.dart';

abstract class PaymentRepository {
  Future<PaginatedResponse<List<WalletResponse>>> getPayment({
    int? offset,
    int? limit,
  });
}
