import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/payment/data/repositories/payment_repository_impl.dart';
import 'package:kabor/features/restaurant/data/data.dart';
import 'package:kabor/features/restaurant/domain/repositories/restaurant_repository.dart';

import '../../data/models/notification_response.dart';
import '../../data/repository/notification_repository_impl.dart';
import '../repositories/notifications_repository.dart';

final getNotificationUsecasesProvider = Provider<GetNotificationUsecase>((ref) {
  return GetNotificationUsecase(ref.watch(notificationRepositoryProvider));
});

class GetNotificationUsecase
    extends NoParamsUsecases<List<NotificationResponse>> {
  GetNotificationUsecase(this.repository);
  final NotificationRepository repository;

  @override
  Future<List<NotificationResponse>> call() async {
    return repository.getNotification();
  }
}
