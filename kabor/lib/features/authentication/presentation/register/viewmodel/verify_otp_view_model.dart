import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';

class VerifyOtpViewModel extends StateNotifier<AsyncValue<String>> {
  VerifyOtpViewModel(this.ref) : super(const AsyncData(''));

  final Ref ref;

  Future<void> verifyOtp({
    required String otp,
    required String phone,
    required String countryCode,
  }) async {
    state = const AsyncLoading();
    final result = await ref.read(authRepositoryProvider).verifyOtp(
          otp: '${otp}56',
          phoneNumber: phone,
          countryCode: countryCode,
        );
    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r.data ?? 'Success'),
    );
  }
}

final verifyOtpVMProvider =
    StateNotifierProvider<VerifyOtpViewModel, AsyncValue<String>>((ref) {
  return VerifyOtpViewModel(ref);
});
