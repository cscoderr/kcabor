import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/address/address.dart';

class ScheduleEventPage extends HookConsumerWidget {
  const ScheduleEventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KaborAppBar(
        title: 'Schedule Event',
        hasBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScheduleEventTabBar(),
            const Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oct 5, 2022',
                      style: context.$style.titleMedium,
                    ),
                    const Gap(10),
                    const ScheduleEventCard(),
                    const Gap(20),
                    const ScheduleEventCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleEventCard extends HookConsumerWidget {
  const ScheduleEventCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationData = ref.watch(currentLocationDataProvider);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: locationData.when(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    const Gap(5),
                    Text(
                      'Shoprite Kwara Mall',
                      style: context.$style.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      'N3500',
                      style: context.$style.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                SolidButton(
                  text: 'View Details ',
                  onPressed: () => context.pushNamed(AppRoutes.rider),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleEventTabBar extends StatelessWidget {
  const ScheduleEventTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorWeight: 0,
        splashFactory: NoSplash.splashFactory,
        indicator: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        tabs: const [
          Tab(text: 'Available Pickups '),
          Tab(text: 'My Pickups '),
        ],
      ),
    );
  }
}
