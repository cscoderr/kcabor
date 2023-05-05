import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';
import 'package:kabor/features/menu/payment/domain/usecase/payment_usecase.dart';
import 'package:kabor/features/notifications/domain/usecases/notification_usecase.dart';

import 'package:kabor/features/notifications/data/models/notification_response.dart';

typedef GetNotificationResponse = AsyncValue<List<NotificationResponse>>;

class GetNotificationViewModel extends StateNotifier<GetNotificationResponse> {
  GetNotificationViewModel(this.ref) : super(const AsyncData([]));

  final Ref ref;

  Future<void> getNotification() async {
    try {
      state = const AsyncLoading();
      final response = await ref.read(getNotificationUsecasesProvider).call();
      state = AsyncData(response);
    } catch (e, stackTrace) {
      state = AsyncError(e.toString(), stackTrace);
    }
  }
}

final getNotificationVMProvider =
    StateNotifierProvider<GetNotificationViewModel, GetNotificationResponse>(
  GetNotificationViewModel.new,
);
