import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/models/paginated_response/paginated_response.dart';
import 'package:kabor/features/menu/payment/data/models/wallet_response.dart';
import 'package:kabor/features/menu/payment/payment.dart';

import '../../domain/repositories/notifications_repository.dart';
import '../models/notification_response.dart';
import '../remote/notification_api_client.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(
    notificationApiClient: ref.watch(notificationApiProvider),
  );
});

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl({
    required NotificationApiClient notificationApiClient,
  }) : _notificationApiClient = notificationApiClient;

  final NotificationApiClient _notificationApiClient;

  @override
  Future<List<NotificationResponse>> getNotification() async {
    return _notificationApiClient.getNotification();
  }
}
