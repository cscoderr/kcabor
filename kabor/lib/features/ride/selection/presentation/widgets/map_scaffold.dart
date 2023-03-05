import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/features/address/address.dart';

class MapScafffold extends HookConsumerWidget {
  const MapScafffold({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationData = ref.watch(currentLocationDataProvider);
    return Scaffold(
      body: Stack(
        children: [
          locationData.when(
            data: (location) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(location.latitude, location.longitude),
                  zoom: 17.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  // _controller.complete(controller);
                },
                compassEnabled: false,
                myLocationButtonEnabled: false,
              );
            },
            error: (error, _) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
          ...children
        ],
      ),
    );
  }
}
