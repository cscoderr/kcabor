import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/address/address.dart';

class LiveLocationPage extends StatefulHookConsumerWidget {
  const LiveLocationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LiveLocationPageState();
}

class _LiveLocationPageState extends ConsumerState<LiveLocationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Marker? _marker;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initBitmapDescriptor(context);
    });
  }

  Future<void> initBitmapDescriptor(BuildContext context) async {
    await _bitmapDescriptorFromSvgAsset(context, AppIcons.marker).then((value) {
      setState(() {
        _marker = Marker(
          markerId: const MarkerId('1'),
          infoWindow: const InfoWindow(title: 'Marker'),
          icon: value,
        );
      });
    });
    // await BitmapDescriptor.fromAssetImage(
    //   const ImageConfiguration(size: Size(12, 12)),
    //   AppIcons.marker,
    // );
  }

  Future<BitmapDescriptor> _bitmapDescriptorFromSvgAsset(
    BuildContext context,
    String assetName,
  ) async {
    final svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);
    //Draws string representation of svg to DrawableRoot
    final svgDrawableRoot = await svg.fromSvgString(svgString, '');
    final picture = svgDrawableRoot.toPicture(
      size: const Size(220, 220),
    );
    final image = await picture.toImage(220, 220);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    final locationData = ref.watch(currentLocationDataProvider);
    return Scaffold(
      body: Stack(
        children: [
          locationData.when(
            data: (location) {
              if (_marker == null) {
                return const Center();
              }
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(location.latitude, location.longitude),
                  zoom: 17.4746,
                ),
                markers: {
                  _marker!.copyWith(
                    positionParam: LatLng(
                      location.latitude,
                      location.longitude,
                    ),
                  ),
                },
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
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 20,
            child: const AppCloseButton(
              color: Color(0xFFC7E7BF),
            ),
          ),
          // Positioned.fill(
          //   child: SvgPicture.asset(
          //     AppIcons.marker,
          //   ),
          // ),
          Positioned(
            bottom: 40,
            right: 20,
            left: 20,
            child: SolidButton(
              text: 'Pick Location',
              onPressed: () => context.pop(),
            ),
          )
        ],
      ),
    );
  }
}
