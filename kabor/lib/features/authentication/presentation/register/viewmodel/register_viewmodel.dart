import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/global_providers.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class RegisterViewModel extends StateNotifier<AsyncValue<void>> {
  RegisterViewModel(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<void> register(AuthModel model) async {
    print(model.toString());
    state = const AsyncLoading();
    final result = await ref.read(customerAuthRepositoryProvider).register(
          firstName: model.firstName ?? '',
          lastName: model.lastName ?? '',
          email: model.email ?? '',
          countryCode: model.countryCode ?? '',
          phoneNumber: model.phoneNumber ?? '',
          password: model.password ?? '',
          refCode: model.refCode,
        );
    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = const AsyncValue.data(null),
    );
  }
}

final registerVMProvider =
    StateNotifierProvider<RegisterViewModel, AsyncValue<void>>((ref) {
  return RegisterViewModel(ref);
});
