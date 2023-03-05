import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/order/presentation/widgets/active_orders_list.dart';
import 'package:kabor/features/view_order/widgets/map.dart';
import 'package:location/location.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key});

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();
  final sourceLocation = const LatLng(37.33500926, -122.03272188);
  final LatLng destination = const LatLng(37.33429383, -122.06600055);
  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  Future<void> getCurrentLocation() async {
    final location = Location();
    await location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    final googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'View Order',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderCard(),
              const Divider(
                color: Colors.grey,
              ),
              Text(
                'Delivery to',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              Text(
                '45, Awotundun Str, Lagos',
                style: context.$style.titleMedium,
              ),
              const Gap(5),
              Text('Sep 16, 2022 2:31pm', style: context.$style.labelLarge),
              const Divider(
                color: Colors.grey,
              ),
              Text(
                'Order Information',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(5),
              Text(
                '2 portion of Scrambled Eggs',
                style: context.$style.titleMedium,
              ),
              const Gap(5),
              Text(
                '2 portion of Poached Eggs (garnished with parlsey and french toast)',
                style: context.$style.titleMedium,
              ),
              const Divider(
                color: Colors.grey,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View Receipt',
                    style: context.$style.titleMedium!.copyWith(
                      color: const Color(0xff3DA925),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Text(
                'Your Order Position',
                style: context.$style.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF2F2F5),
                ),
                child: Column(
                  children: [
                    GoogleMapp(
                      currentLocation: currentLocation,
                      sourceLocation: sourceLocation,
                      destination: destination,
                      controller: _controller,
                      polylineCoordinates: polylineCoordinates,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Order from',
                                style: context.$style.bodyLarge,
                              ),
                              Text(
                                'Poached - GRA, Ilorin',
                                style: context.$style.bodyLarge!.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Sent ',
                                    style: context.$style.bodyLarge,
                                  ),
                                  Text(
                                    '12:56pm - 1:30pm',
                                    style: context.$style.bodyLarge,
                                  ),
                                ],
                              ),
                              const Gap(15),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .42,
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff3DA925),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add to bag',
                          style: context.$style.titleLarge!.copyWith(
                            color: const Color(0xff3DA925),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .42,
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        color: const Color(0xff3DA925),
                      ),
                      child: Center(
                        child: Text(
                          'Express Re-order',
                          style: context.$style.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
