import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/ride/ride.dart';
import 'package:timelines/timelines.dart';

class NewOrderPage extends HookConsumerWidget {
  const NewOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = useState(true);
    return MapScafffold(
      children: [
        _buildTopWidget(isOnline: isOnline),
        1 == 2 ? _buildBottomSheet(context) : _buildBottomSheet2(context),
      ],
    );
  }

  Widget _buildTopWidget({
    required ValueNotifier<bool> isOnline,
  }) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppCloseButton(),
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
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context, {
    ValueNotifier<bool>? showContact,
    ValueNotifier<bool>? showSafety,
    ValueNotifier<bool>? showShareRider,
  }) {
    const fullHeight = 3.2;
    return MapBottomSheet(
      heightDivisor: 2.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const QueueCard(isActive: true),
              const Gap(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ajayi Pelumi',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'N3500',
                    style: context.$style.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    '2.5km',
                    style: context.$style.titleSmall!.copyWith(
                      color: AppColors.dark2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(10),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: TripLines(),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  '1',
                  style: context.$style.headline4!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SolidButton(
                  text: 'Decline',
                  onPressed: () {},
                ),
              ),
              const Gap(20),
              Expanded(
                child: SolidButton(
                  text: 'Accept',
                  onPressed: () => context.pushNamed(AppRoutes.rider),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet2(
    BuildContext context, {
    ValueNotifier<bool>? showContact,
    ValueNotifier<bool>? showSafety,
    ValueNotifier<bool>? showShareRider,
  }) {
    const fullHeight = 3.2;
    return MapBottomSheet(
      heightDivisor: 2.5,
      child: Column(
        children: [
          const QueueCard(isActive: true),
          const Gap(10),
          Text(
            'Poached ',
            style: context.$style.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Gap(5),
          Text(
            'Flower Garden , Ilorin',
            style: context.$style.titleSmall!.copyWith(
              color: AppColors.dark2,
            ),
          ),
          const Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'N3500',
                style: context.$style.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
              const Gap(10),
              Text(
                '1 order',
                style: context.$style.titleSmall!.copyWith(
                  color: AppColors.dark2,
                ),
              ),
            ],
          ),
          const Gap(20),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryColor,
              child: Text(
                '1',
                style: context.$style.headline4!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: SolidButton(
                  text: 'Decline',
                  onPressed: () {},
                ),
              ),
              const Gap(20),
              Expanded(
                child: SolidButton(
                  text: 'Accept',
                  onPressed: () => context.pushNamed(AppRoutes.rider),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TripLines extends StatelessWidget {
  const TripLines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: AppColors.primaryColor,
        indicatorTheme: const IndicatorThemeData(
          position: 0,
          size: 16,
        ),
        connectorTheme: const ConnectorThemeData(
          thickness: 3,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        indicatorBuilder: (_, index) {
          return const DotIndicator(
            color: AppColors.primaryColor,
          );
        },
        connectorBuilder: (_, index, ___) => const SolidLineConnector(
          color: AppColors.primaryColor,
        ),
        itemExtent: 60,
        itemCount: 2,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Text(
                'Shoprite Kwara Mall',
                style: context.$style.titleMedium,
              ),
              Text(
                'Fate Road, Ilorin, Nigeria ',
                style: context.$style.labelMedium?.copyWith(
                  color: AppColors.dark2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
