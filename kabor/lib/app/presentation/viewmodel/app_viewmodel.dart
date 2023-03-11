import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/app/presentation/viewmodel/app_state.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel(this.ref) : super(const AppState()) {
    _streamSubscription = ref.read(kaborRepositoryProvider).authStatus.listen(
          _onStatusChanged,
        );
  }
  final Ref ref;

  late final StreamSubscription _streamSubscription;

  Future<void> _onStatusChanged(AuthStatus event) async {
    if (event == AuthStatus.authenticated) {
      final user = await ref.watch(kaborRepositoryProvider).user;
      state = state.copyWith(
        user: user,
        authStatus: event,
      );
    } else {
      state = state.copyWith(
        authStatus: event,
      );
    }
  }

  void updateUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void updateAuthData(AuthModel authData) {
    state = state.copyWith(authModel: authData);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}

final appVMProvider = StateNotifierProvider<AppViewModel, AppState>((ref) {
  return AppViewModel(ref);
});
