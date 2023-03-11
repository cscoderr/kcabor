import 'dart:async';
import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:google_place/google_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';
import 'package:kcabor_storage/kcabor_storage.dart';
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
  KaborRepositoryImpl({required this.storage});

  final KcaborStorage storage;

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

  @override
  Stream<AuthStatus> get authStatus async* {
    final hasUser = await storage.check('kcabor_user');
    final hasToken = await storage.check('kcabor_token');
    if (hasUser && hasToken) {
      yield AuthStatus.authenticated;
    }
    yield AuthStatus.unauthenticated;
  }

  @override
  Future<UserModel?> get user async {
    final user = await storage.read('kcabor_user');
    if (user == null) return null;
    final jsonData = jsonDecode(user) as Map<String, dynamic>;
    return UserModel.fromJson(jsonData);
  }
}

final kaborRepositoryProvider = Provider<KaborRepository>((ref) {
  return KaborRepositoryImpl(
    storage: ref.watch(kcaborStorageProvider),
  );
});
