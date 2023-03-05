import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/address/address.dart';

class SelectionPage extends ConsumerWidget {
  const SelectionPage({super.key});

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
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xffDDE5E9),
                ),
              ),
              child: Row(
                children: [
                  const AppBackButton(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Iconsax.search_normal),
                        SizedBox(width: 10),
                        Text('Enter search'),
                      ],
                    ),
                  ),
                  const AppAddButton(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '20% promo code  applied',
                    style: context.$style.labelLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.16,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLightColor3,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Economy'),
                        ),
                        const Gap(10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Luxury',
                            style: context.$style.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'See all',
                          style: context.$style.labelLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Gap(10);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return SelectionCard(
                          isActive: index == 0,
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.card,
                        ),
                        Text(
                          'Card 1226** ',
                          style: context.$style.bodySmall?.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                        const Icon(
                          Iconsax.arrow_down_1,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SolidButton(
                      text: 'Select Kaboor',
                      onPressed: () => context.pushNamed(AppRoutes.confirmRide),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isActive
          ? const EdgeInsets.only(
              right: 20,
            )
          : const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor2 : Colors.white,
      ),
      child: Row(
        children: [
          if (isActive)
            Container(
              width: 5,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
            ),
          Image.asset(AppImages.tricycle),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Kaboor',
                      style: context.$style.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      '3',
                      style: context.$style.titleMedium?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const Text('in 22min'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'NGN 300',
                style: context.$style.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'NGN 4500',
                style: context.$style.bodySmall?.copyWith(
                  color: AppColors.dark2,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
