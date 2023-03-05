import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/global_providers.dart';

class LoginViewModel extends StateNotifier<AsyncValue<void>> {
  LoginViewModel(this.ref) : super(const AsyncData<void>(null));
  final Ref ref;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    print(email);
    state = const AsyncLoading();
    final result = await ref.read(customerAuthRepositoryProvider).login(
          emailOrPhone: email,
          password: password,
        );
    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = const AsyncData(null),
    );
  }
}

final loginProvider =
    StateNotifierProvider<LoginViewModel, AsyncValue<void>>((ref) {
  return LoginViewModel(ref);
});
