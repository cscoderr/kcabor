import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

final currentLocationDataProvider =
    FutureProvider.autoDispose<geolocator.Position>((ref) async {
  final location = Location();

  var _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  var _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return Future.error('Location services are disabled.');
    }
  }

  final position = await geolocator.Geolocator.getCurrentPosition(
    desiredAccuracy: geolocator.LocationAccuracy.high,
  );
  print(position.latitude);
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
