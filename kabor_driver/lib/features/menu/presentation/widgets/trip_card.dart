import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRoutes.tripDetails),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(AppImages.chat),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sept 22, 8:44am',
                  style: context.$style.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.person),
                    const Gap(7),
                    Text(
                      '7.2m.25',
                      style: context.$style.bodySmall?.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'N5000',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Promo',
                style: context.$style.bodySmall?.copyWith(
                  color: AppColors.dark2,
                ),
              ),
            ],
          ),
          const Gap(10),
          const Icon(Iconsax.arrow_right_3),
        ],
      ),
    );
  }
}
