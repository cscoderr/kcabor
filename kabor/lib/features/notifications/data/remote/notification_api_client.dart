import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/http/http.dart';

import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/payment/data/models/wallet_response.dart';

import '../models/notification_response.dart';

final notificationApiProvider = Provider<NotificationApiClient>((ref) {
  return NotificationApiClientImpl(httpClient: ref.watch(mainhttpProvider));
});

abstract class NotificationApiClient {
  Future<List<NotificationResponse>> getNotification();
}

class NotificationApiClientImpl extends NotificationApiClient {
  NotificationApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<List<NotificationResponse>> getNotification() async {
    // try {
    final response = await _httpClient.get(
      Uri.parse('${AppConstants.baseUrl}/customer/notifications'),
    );
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as List<dynamic>;

      return data
          .map(
            (e) => NotificationResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
    throw Exception('Error fetching notification');
  }
  // catch (e) {
  //   print(e);
  //   throw Exception('Error fetching popular foods');
  // }
  // }
}
