// ignore_for_file: one_member_abstracts

import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/http/http.dart';

import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/payment/data/models/wallet_response.dart';

final paymentsApiProvider = Provider<PaymentApiClient>((ref) {
  return PaymentApiClientImpl(httpClient: ref.watch(mainhttpProvider));
});

abstract class PaymentApiClient {
  Future<PaginatedResponse<List<WalletResponse>>> getPayment({
    int? offset,
    int? limit,
  });
}

class PaymentApiClientImpl extends PaymentApiClient {
  PaymentApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<PaginatedResponse<List<WalletResponse>>> getPayment({
    int? offset,
    int? limit,
  }) async {
    // try {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/customer/wallet/transactions').replace(
        queryParameters: {
          if (offset != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      ),
    );
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return PaginatedResponse.fromJson(
        data,
        (json) {
          return (json as List)
              .map(
                (e) => WalletResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        },
      );
    }
    throw Exception('Error fetching payments');
  }
  // catch (e) {
  //   print(e);
  //   throw Exception('Error fetching popular foods');
  // }
  // }
}
