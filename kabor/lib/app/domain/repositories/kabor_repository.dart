import 'package:authentication_repository/authentication_repository.dart';
import 'package:kabor/app/data/data.dart';
import 'package:kabor/core/core.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

abstract class KcaborRepository {
  Stream<AuthStatus> get authStatus;
  Future<UserModel?> get user;
  Future<void> searchGoogleAddress(String address);

  Future<ZoneModel> getZoneId({
    required double latitude,
    required double longitude,
  });

  Stream<List<GooglePlaceModel>> get searchAddressSream;
}
