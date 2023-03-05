import 'package:kabor/core/core.dart';
import 'package:kabor/features/authentication/domain/repositories/authentication_repository.dart';

class LoginUsecases implements Usecases {
  LoginUsecases(this.repository);
  final AuthenticationRepository repository;
  @override
  Future<void> call(params) {
    return repository.login();
  }
}
