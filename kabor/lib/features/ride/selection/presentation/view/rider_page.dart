import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/ride/ride.dart';
import 'package:timelines/timelines.dart';

class RiderPage extends HookConsumerWidget {
  const RiderPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFull = useState(false);
    final showContact = useState(false);
    final showSafety = useState(false);
    final showShareRider = useState(false);
    return MapScafffold(
      children: [
        _buildBottomSheet(
          context,
          isFull,
          showContact: showContact,
          showSafety: showSafety,
          showShareRider: showShareRider,
        ),
        if (showContact.value)
          _buildContactBottomSheet(context, showContact: showContact),
        if (showSafety.value) _buildSafetyBottomSheet(context, showSafety),
        if (showShareRider.value)
          _buildShareRiderDetailsBottomSheet(context, showShareRider),
      ],
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ValueNotifier<bool> isFull, {
    ValueNotifier<bool>? showContact,
    ValueNotifier<bool>? showSafety,
    ValueNotifier<bool>? showShareRider,
  }) {
    const fullHeight = 3.2;
    return MapBottomSheet(
      heightDivisor: isFull.value ? 1.2 : fullHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                isFull.value = !isFull.value;
              },
              onDoubleTap: () {
                isFull.value = !isFull.value;
              },
              onVerticalDragStart: (details) {
                isFull.value = !isFull.value;
              },
              child: Container(
                height: 5,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const Gap(10),
          Center(
            child: Text(
              'ARRIVING IN A MIN',
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Gap(10),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Joseph is on their way',
                              style: context.$style.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Toyota Camry',
                              style: context.$style.labelMedium?.copyWith(),
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  itemSize: 30,
                                  itemBuilder: (context, _) => const Icon(
                                    Iconsax.star1,
                                    color: Color(0xFFE5B800),
                                  ),
                                  onRatingUpdate: print,
                                ),
                                const Gap(5),
                                Text(
                                  '4.0',
                                  style: context.$style.titleLarge?.copyWith(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppImages.car2,
                        width: 150,
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Divider(),
                  const Gap(10),
                  _buildBottomWidget(
                    context,
                    showContact: showContact,
                    showSafety: showSafety,
                  ),
                  if (isFull.value)
                    _buildFullSizeWidget(
                      context,
                      showShareRider: showShareRider,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullSizeWidget(
    BuildContext context, {
    ValueNotifier<bool>? showShareRider,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Gap(10),
        GestureDetector(
          onTap: () => showShareRider?.value = true,
          child: Row(
            children: [
              const Icon(Iconsax.share),
              const Gap(15),
              Expanded(
                child: Text(
                  'Share this ride details ',
                  style: context.$style.titleLarge?.copyWith(),
                ),
              ),
              const Icon(Iconsax.arrow_right_3),
            ],
          ),
        ),
        const Gap(10),
        const Divider(),
        const Gap(10),
        Row(
          children: [
            const Icon(Iconsax.arrow),
            const Gap(15),
            Expanded(
              child: Text(
                'Riding with someone ?',
                style: context.$style.titleLarge?.copyWith(),
              ),
            ),
            InkWell(
              onTap: () => context.pushNamed(AppRoutes.requestPayment),
              child: Text(
                'Pay for me',
                style: context.$style.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        const Divider(),
        const Gap(10),
        Text(
          'Payment',
          style: context.$style.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(10),
        Text(
          'NGN 3500',
          style: context.$style.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        Text(
          "You'll pay this price unless you change your destination or add a stop",
          style: context.$style.titleMedium?.copyWith(),
        ),
        const Gap(10),
        const Divider(),
        const Gap(10),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.card,
            ),
            const Gap(5),
            Expanded(
              child: Text(
                'Card 1226** ',
                style: context.$style.labelLarge?.copyWith(
                  color: AppColors.dark2,
                ),
              ),
            ),
            const Icon(
              Iconsax.arrow_right_3,
              size: 20,
            ),
          ],
        ),
        const Gap(10),
        const Divider(),
        Text(
          'Trip',
          style: context.$style.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(15),
        const TripLines(),
        const Divider(),
        const Gap(10),
        InkWell(
          onTap: () => context.pushNamed(AppRoutes.complete),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppAddButton(),
              const Gap(10),
              Text(
                'Add Stop',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
      ],
    );
  }

  Widget _buildBottomWidget(
    BuildContext context, {
    ValueNotifier<bool>? showContact,
    ValueNotifier<bool>? showSafety,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RiderTile(
          text: 'Edit Ride',
          icon: Iconsax.edit5,
          onTap: () async {
            await showConfirmationDialog<int>(
              context: context,
              title: 'Edit Ride',
              cancelLabel: 'Cancel',
              actions: [
                const AlertDialogAction(
                  label: 'Cancel Ride',
                  textStyle: TextStyle(
                    color: AppColors.red,
                  ),
                  key: 0,
                ),
                const AlertDialogAction(
                  label: 'Add Stop',
                  textStyle: TextStyle(
                    color: AppColors.red,
                  ),
                  key: 0,
                ),
                const AlertDialogAction(
                  label: 'Edit Pickup',
                  textStyle: TextStyle(
                    color: AppColors.red,
                  ),
                  key: 0,
                ),
                const AlertDialogAction(
                  label: 'Edit Destination',
                  textStyle: TextStyle(
                    color: AppColors.red,
                  ),
                  key: 0,
                ),
              ],
            );
          },
        ),
        RiderTile(
          text: 'Safety',
          icon: Iconsax.shield_tick5,
          onTap: () => showSafety?.value = true,
        ),
        RiderTile(
          text: 'Message',
          icon: Iconsax.messages_35,
          onTap: () => context.pushNamed(AppRoutes.chats),
        ),
        RiderTile(
          text: 'Contact',
          icon: Iconsax.call5,
          onTap: () => showContact?.value = true,
        ),
      ],
    );
  }

  Widget _buildShareRiderDetailsBottomSheet(
    BuildContext context,
    ValueNotifier<bool> showShareRider,
  ) {
    return MapBottomSheet(
      heightDivisor: 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: AppCloseButton(
              color: AppColors.primaryColor2,
              onTap: () => showShareRider.value = false,
            ),
          ),
          Text(
            'Share ride details',
            style: context.$style.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(10),
          const Text(
            'Add contacts to share ride into regularly or send a link to someone instead ',
          ),
          const Gap(20),
          const AddContactButton(),
          const Gap(10),
          const Divider(),
          const Gap(10),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.primaryColor2,
                child: Icon(
                  Iconsax.share,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const Gap(15),
              Text(
                'Send a link for this ride instead ',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyBottomSheet(
    BuildContext context,
    ValueNotifier<bool> showSafety,
  ) {
    return MapBottomSheet(
      heightDivisor: 2,
      ondrag: () => showSafety.value = false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Safety Toolkit',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(30),
            const SafetyCard(
              title: 'Learn about safety at Kabor ',
              subTitle: 'Get details about our safety features',
              icon: Iconsax.bubble,
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            const SafetyCard(
              title: 'Share my trip',
              subTitle:
                  'Let family and friends see your location and trip status ',
              icon: Iconsax.share,
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            const SafetyCard(
              title: 'Report saftey issue',
              subTitle: 'Report safety issue you encountered on this trip',
              icon: Iconsax.information,
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            const SafetyCard(
              title: '911 assistance ',
              subTitle:
                  'Contact 911 and share your location with the authorization in an emergency ',
              icon: Iconsax.alarm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactBottomSheet(
    BuildContext context, {
    required ValueNotifier<bool> showContact,
  }) {
    return MapBottomSheet(
      heightDivisor: 1.4,
      ondrag: () {
        showContact.value = false;
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Joseph',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Toyota Camry',
              style: context.$style.titleMedium?.copyWith(),
            ),
            const Gap(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    AppImages.car2,
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppImages.food3),
                ),
              ],
            ),
            const Gap(20),
            Text(
              'Safety first -Always confirm the license plate and your driver before getting in',
              textAlign: TextAlign.center,
              style: context.$style.labelLarge?.copyWith(),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '4.5K+',
                      style: context.$style.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Rides',
                      style: context.$style.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Gap(12),
                const HorizontalDivider(),
                const Gap(12),
                Column(
                  children: [
                    Text(
                      '4.5K+',
                      style: context.$style.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Ratings',
                      style: context.$style.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Gap(12),
                const HorizontalDivider(),
                const Gap(12),
                Column(
                  children: [
                    Text(
                      '5.3',
                      style: context.$style.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Years',
                      style: context.$style.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Gap(20),
            Text(
              'Driver Atrributes',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'These are rider’s compliments ',
              style: context.$style.labelLarge?.copyWith(),
            ),
            const Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                DriverAttributeTile(
                  image: AppImages.steering1,
                ),
                DriverAttributeTile(
                  image: AppImages.steering2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddContactButton extends StatelessWidget {
  const AddContactButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: const Icon(
            Iconsax.add,
            color: AppColors.dark3,
            size: 40,
          ),
        ),
        const Gap(10),
        const Text(
          'Add contacts  ',
        ),
      ],
    );
  }
}

class SafetyCard extends StatelessWidget {
  const SafetyCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon,
  });

  final String title;
  final String subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) Icon(icon),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Get details about our safety features ',
              style: context.$style.labelLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class DriverAttributeTile extends StatelessWidget {
  const DriverAttributeTile({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          image,
        ),
        Positioned(
          bottom: -10,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.backgroundLightColor2,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: const Text('500'),
          ),
        ),
      ],
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class RiderTile extends StatelessWidget {
  const RiderTile({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon),
          const Gap(5),
          Text(text),
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
