import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';

class CheckEmailViewModel extends AutoDisposeAsyncNotifier<BaseModel> {
  @override
  FutureOr<BaseModel> build() {
    return const BaseModel();
  }

  Future<void> checkEmail(String email) async {
    state = const AsyncLoading();
    final result = await ref.read(customerAuthRepositoryProvider).checkEmail(
          email: email,
        );
    return result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}

final checkEmailVMProvider =
    AutoDisposeAsyncNotifierProvider<CheckEmailViewModel, BaseModel>(
        CheckEmailViewModel.new);
