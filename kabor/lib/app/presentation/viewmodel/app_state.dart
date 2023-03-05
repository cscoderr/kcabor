import 'package:equatable/equatable.dart';
import 'package:kabor/core/models/user/user_model.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class AppState extends Equatable {
  const AppState({
    this.user = const UserModel(),
    this.authModel = const AuthModel(),
  });

  AppState copyWith({
    UserModel? user,
    AuthModel? authModel,
  }) {
    return AppState(
      user: user ?? this.user,
      authModel: authModel ?? this.authModel,
    );
  }

  final UserModel user;
  final AuthModel authModel;

  @override
  List<Object?> get props => [user, authModel];
}
