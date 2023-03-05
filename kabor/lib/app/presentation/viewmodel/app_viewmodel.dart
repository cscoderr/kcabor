import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/presentation/viewmodel/app_state.dart';
import 'package:kabor/core/models/user/user_model.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel(this.ref) : super(const AppState());
  final Ref ref;

  void updateUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void updateAuthData(AuthModel authData) {
    state = state.copyWith(authModel: authData);
  }
}

final appVMProvider = StateNotifierProvider<AppViewModel, AppState>((ref) {
  return AppViewModel(ref);
});
