import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class AppState extends Equatable {
  const AppState({
    this.user = const UserModel(),
    this.authModel = const AuthModel(),
    this.authStatus = AuthStatus.unknown,
  });

  AppState copyWith({
    UserModel? user,
    AuthModel? authModel,
    AuthStatus? authStatus,
  }) {
    return AppState(
      user: user ?? this.user,
      authModel: authModel ?? this.authModel,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  final UserModel user;
  final AuthModel authModel;
  final AuthStatus authStatus;

  @override
  List<Object?> get props => [user, authModel, authStatus];
}
