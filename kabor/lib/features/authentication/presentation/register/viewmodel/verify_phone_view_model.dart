import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';

class VerifyPhoneViewModel extends StateNotifier<AsyncValue<String>> {
  VerifyPhoneViewModel(this.ref) : super(const AsyncData(''));

  final Ref ref;

  Future<void> verifyPhone(
      {required String phone, required String countryCode}) async {
    state = const AsyncLoading();
    final result =
        await ref.read(customerAuthRepositoryProvider).verifyPhoneNumber(
              phoneNumber: phone,
              countryCode: countryCode,
            );
    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}

final verifyPhoneVMProvider =
    StateNotifierProvider<VerifyPhoneViewModel, AsyncValue<String>>((ref) {
  return VerifyPhoneViewModel(ref);
});
