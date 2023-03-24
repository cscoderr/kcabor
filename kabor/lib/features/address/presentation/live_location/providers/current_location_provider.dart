import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

final currentLocationDataProvider =
    FutureProvider.autoDispose<geolocator.Position>((ref) async {
  final location = Location();

  var serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  var permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return Future.error('Location services are disabled.');
    }
  }

  final position = await geolocator.Geolocator.getCurrentPosition(
    desiredAccuracy: geolocator.LocationAccuracy.high,
  );
  return position;
});

final currentLocationProvider = Provider.autoDispose<LatLng>((ref) {
  final locationData = ref.watch(currentLocationDataProvider);

  return locationData.maybeWhen(
    data: (data) {
      return LatLng(data.latitude, data.longitude);
    },
    orElse: () => const LatLng(6.498508, 3.353275),
  );
});
