import 'dart:async';

import 'package:google_place/google_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';
import 'package:rxdart/rxdart.dart';

class SearchException implements Exception {
  SearchException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}

class KaborRepositoryImpl implements KaborRepository {
  final googlePlace = GooglePlace(
    'AIzaSyAZ8qO-8-ZBW3TzNzBfhUCBNxpU8-EX9ss',
    // const String.fromEnvironment('GOOGLE_API_KEY'),
  );
  final _searchTerms = BehaviorSubject<String>();

  final streamAddressController =
      StreamController<List<GooglePlaceModel>>.broadcast();
  @override
  Future<void> searchGoogleAddress(String address) async {
    _searchTerms.add(address);
  }

  Future<List<GooglePlaceModel>> _searchGoogleAddress(String address) async {
    try {
      if (address.isEmpty) return [];
      final results = await googlePlace.autocomplete.get(
        address,
        language: 'en',
        components: [Component('country', 'ng')],
      );

      if (results?.status == 'OK') {
        final placeAddress = <GooglePlaceModel>[];

        for (var i = 0; i < (results?.predictions?.length ?? 0); i++) {
          final address = results!.predictions![i];
          placeAddress.add(
            GooglePlaceModel(
              id: address.placeId,
              address: address.structuredFormatting?.mainText,
              formattedAddress:
                  '${address.structuredFormatting?.mainText}, ${address.structuredFormatting?.secondaryText}',
            ),
          );
        }
        streamAddressController.add(placeAddress);
        return placeAddress;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  @override
  Stream<List<GooglePlaceModel>> get searchAddressSream {
    return _searchTerms
        .debounce(
      (event) => TimerStream<dynamic>(true, const Duration(milliseconds: 300)),
    )
        .switchMap((query) async* {
      yield await _searchGoogleAddress(query);
    });
  }
}

final kaborRepositoryProvider = Provider<KaborRepository>((ref) {
  return KaborRepositoryImpl();
});
