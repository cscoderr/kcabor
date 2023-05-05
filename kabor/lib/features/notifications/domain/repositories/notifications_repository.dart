import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/payment/data/models/wallet_response.dart';

import '../../data/models/notification_response.dart';

abstract class NotificationRepository {
  Future<List<NotificationResponse>> getNotification();
}
