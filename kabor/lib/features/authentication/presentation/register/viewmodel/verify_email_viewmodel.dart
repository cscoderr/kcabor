import 'package:app_models/app_models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';

class VerifyEmailViewModel extends StateNotifier<AsyncValue<BaseModel>> {
  VerifyEmailViewModel(this.ref) : super(const AsyncData(BaseModel()));

  final Ref ref;

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    state = const AsyncLoading();
    final result = await ref.read(customerAuthRepositoryProvider).verifyEmail(
          email: email,
          otp: '${otp}56',
        );
    return result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}

final verifyEmailVMProvider = StateNotifierProvider.autoDispose<
    VerifyEmailViewModel, AsyncValue<BaseModel>>(
  (ref) {
    return VerifyEmailViewModel(ref);
  },
);
