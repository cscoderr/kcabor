import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';

final getZoneIdProvider =
    FutureProvider.family<void, LatLng>((ref, latLng) async {
  if (latLng == const LatLng(6.498508, 3.353275)) {
    return;
  }
  await ref.read(getZoneIdUsecaseProvider).call(
        GetZoneIdParams(
          latitude: latLng.latitude,
          longitude: latLng.longitude,
        ),
      );
});
