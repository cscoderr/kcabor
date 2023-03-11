import 'package:authentication_repository/authentication_repository.dart';
import 'package:kabor/app/data/data.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

abstract class KaborRepository {
  Stream<AuthStatus> get authStatus;
  Future<UserModel?> get user;
  Future<void> searchGoogleAddress(String address);

  Stream<List<GooglePlaceModel>> get searchAddressSream;
}
