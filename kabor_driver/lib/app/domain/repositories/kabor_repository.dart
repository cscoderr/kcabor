import 'package:kabor_driver/app/data/data.dart';

abstract class KaborRepository {
  Future<void> searchGoogleAddress(String address);

  Stream<List<GooglePlaceModel>> get searchAddressSream;
}
