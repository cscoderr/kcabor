import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapp extends StatelessWidget {
  const GoogleMapp({
    Key? key,
    required this.currentLocation,
    required this.sourceLocation,
    required this.destination,
    required Completer<GoogleMapController> controller,
    required this.polylineCoordinates,
  })  : _controller = controller,
        super(key: key);

  final LocationData? currentLocation;
  final LatLng sourceLocation;
  final LatLng destination;
  final Completer<GoogleMapController> _controller;
  final List<LatLng> polylineCoordinates;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: currentLocation == null
          ? const Center(
              child: Text('Loading...'),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                zoom: 13.5,
              ),
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                ),
                Marker(
                  markerId: const MarkerId('source'),
                  position: sourceLocation,
                ),
                Marker(
                  markerId: const MarkerId('destination'),
                  position: destination,
                ),
              },
              onMapCreated: _controller.complete,
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
    );
  }
}
