import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/address/address.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RestaurantTrackingPage extends HookConsumerWidget {
  const RestaurantTrackingPage({super.key});

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
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Order from',
                              style: context.$style.titleSmall,
                            ),
                            const Gap(5),
                            Text(
                              'Poached - GRA, Ilorin',
                              style: context.$style.titleSmall?.copyWith(
                                color: AppColors.dark2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Sent ',
                            style: context.$style.titleSmall,
                          ),
                          const Gap(5),
                          Text(
                            '12:56pm - 1:30pm',
                            style: context.$style.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(20),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 40,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 11,
                    percent: 0.2,
                    barRadius: const Radius.circular(20),
                    progressColor: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: context.$style.titleSmall,
                      ),
                      const Gap(5),
                      Text(
                        '45 Awotundun Street, Lagos ',
                        style: context.$style.titleSmall?.copyWith(
                          color: AppColors.dark2,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  SolidButton(
                    text: 'View Order Details ',
                    onPressed: () =>
                        context.pushNamed(AppRoutes.restaurantTrackingDetails),
                  ),
                  const Gap(15),
                  SolidButton(
                    text: 'Call Rider',
                    color: Colors.white,
                    textColor: AppColors.primaryColor,
                    onPressed: () => context.pop(),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
