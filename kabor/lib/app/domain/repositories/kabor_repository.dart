import 'package:kabor/app/data/data.dart';

abstract class KaborRepository {
  Future<void> searchGoogleAddress(String address);

  Stream<List<GooglePlaceModel>> get searchAddressSream;
}
