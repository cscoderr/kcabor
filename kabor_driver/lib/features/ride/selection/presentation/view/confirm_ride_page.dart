import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

import 'package:kabor_driver/features/ride/ride.dart';

class ConfirmRidePage extends HookConsumerWidget {
  const ConfirmRidePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapScafffold(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
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
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Change ride ',
                          style: context.$style.labelLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(AppImages.car1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
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
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SolidButton(
                    text: 'Confirm Kaboor',
                    onPressed: () => context.pushNamed(AppRoutes.confirmPickup),
                  ),
                )
              ],
            ),
          ),
        ),
        const MapBackButton(),
      ],
    );
  }
}
