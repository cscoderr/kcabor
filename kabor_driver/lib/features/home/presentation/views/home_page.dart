import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/address/address.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    final locationData = ref.watch(currentLocationDataProvider);
    final isOnline = useState(false);
    final dragContainerValue = useState(250.0);
    return Scaffold(
      key: scaffoldKey.value,
      drawer: const AppDrawer(),
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
          _buildTopWidget(
            context,
            scaffoldKey: scaffoldKey.value,
            isOnline: isOnline,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isOnline.value
                  ? _buildBottomWidget(
                      context,
                      dragContainerValue: dragContainerValue,
                    )
                  : _buildOfflineWidget(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineWidget(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Text(
            'You are currently offline. ',
            style: context.$style.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Gap(5),
          Text(
            'Tap on the power button the top-right corner of your screen to come online and queues will appear here ',
            style: context.$style.titleSmall!.copyWith(
              color: AppColors.dark2,
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildTopWidget(
    BuildContext context, {
    required GlobalKey<ScaffoldState> scaffoldKey,
    required ValueNotifier<bool> isOnline,
  }) {
    return Positioned.fill(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkResponse(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Material(
                  elevation: 3,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.menu_1,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              const Spacer(),
              // if (isOnline.value)
              AnimatedSlide(
                offset: Offset(0, isOnline.value ? 0 : -1),
                duration: const Duration(milliseconds: 100),
                child: AnimatedOpacity(
                  opacity: isOnline.value ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'You are back online ',
                      style: context.$style.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // else
              //   AnimatedSlide(
              //     offset: Offset(0, !isOnline.value ? 0.5 : 0),
              //     duration: const Duration(milliseconds: 300),
              //     child: AnimatedOpacity(
              //       opacity: !isOnline.value ? 1 : 0,
              //       duration: const Duration(milliseconds: 300),
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 10, vertical: 15),
              //         decoration: BoxDecoration(
              //           color: AppColors.red,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: Text(
              //           'You are offline ',
              //           style: context.$style.labelLarge?.copyWith(
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              const Spacer(),
              FlutterSwitch(
                width: 45,
                height: 24,
                valueFontSize: 25,
                toggleSize: 15,
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.white,
                inactiveToggleColor: AppColors.primaryColor,
                value: isOnline.value,
                activeIcon: SvgPicture.asset(
                  AppImages.steering1,
                  color: AppColors.primaryColor,
                ),
                inactiveIcon: SvgPicture.asset(
                  AppImages.steering1,
                  color: Colors.white,
                ),
                switchBorder: Border.all(color: AppColors.primaryColor),
                onToggle: (value) {
                  isOnline.value = value;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomWidget(
    BuildContext context, {
    required ValueNotifier<double> dragContainerValue,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: (details) {
        print(details.kind);
      },
      onVerticalDragEnd: (details) {},
      onVerticalDragUpdate: (details) {
        if (details.delta.direction < 1) {
          dragContainerValue.value = details.globalPosition.dy;
        }
      },
      child: AnimatedContainer(
        height: dragContainerValue.value,
        duration: const Duration(milliseconds: 200),
        constraints: BoxConstraints(
          minHeight: 250,
          maxHeight: MediaQuery.of(context).size.height / 1.5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Start Earning, ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'John',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Scan for nearby requests ',
                        style: context.$style.titleSmall!.copyWith(
                          color: AppColors.dark2,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSearchButton(
                  onTap: () => 1 == 2
                      ? context.pushNamed(AppRoutes.search)
                      : context.pushNamed(AppRoutes.connectRider),
                ),
              ],
            ),
            const Gap(5),
            const Divider(),
            const Gap(10),
            Text(
              'Queue',
              style: context.$style.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.dark,
              ),
            ),
            const Gap(10),
            Row(
              children: const [
                QueueCard(isActive: true),
                Gap(10),
                QueueCard(),
                Gap(10),
                QueueCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeBottomWidget(
    BuildContext context, {
    required ValueNotifier<double> dragContainerValue,
  }) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height / 1.5,
      duration: const Duration(milliseconds: 200),
      constraints: BoxConstraints(
        minHeight: 250,
        maxHeight: MediaQuery.of(context).size.height / 1.5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scan for nearby requests ',
                      style: context.$style.titleSmall!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
              ),
              AppSearchButton(
                onTap: () => context.push(AppRoutes.search),
              ),
            ],
          ),
          const Gap(5),
          const Divider(),
          const Gap(10),
          Text(
            'Queue',
            style: context.$style.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Gap(5),
          Text(
            'Active',
            style: context.$style.titleSmall!.copyWith(
              color: AppColors.dark2,
            ),
          ),
          const Gap(20),
          const UserRequestCard(
            hasTrailing: true,
          ),
          const Gap(20),
          Text(
            'Schedule Pickups',
            style: context.$style.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Gap(20),
          const UserRequestCard(),
          const Gap(15),
          const UserRequestCard(),
          const Gap(15),
          const UserRequestCard(),
        ],
      ),
    );
  }
}

class UserRequestCard extends StatelessWidget {
  const UserRequestCard({Key? key, this.hasTrailing = false}) : super(key: key);

  final bool hasTrailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const QueueCard(isActive: true),
        const Gap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Queue',
                style: context.$style.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
              const Gap(5),
              Text(
                'Kabor',
                style: context.$style.titleSmall!.copyWith(
                  color: AppColors.dark2,
                ),
              ),
            ],
          ),
        ),
        if (hasTrailing)
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: const Icon(
              Iconsax.location5,
              color: AppColors.primaryColor,
            ),
          ),
      ],
    );
  }
}

class QueueCard extends StatelessWidget {
  const QueueCard({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AppImages.user1),
        ),
        if (isActive)
          const Positioned(
            right: 0,
            top: 8,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.primaryColor,
            ),
          )
      ],
    );
  }
}
