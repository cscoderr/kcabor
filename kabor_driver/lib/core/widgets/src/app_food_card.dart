import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class AppFoodCard extends HookConsumerWidget {
  const AppFoodCard({
    super.key,
    this.width = 230,
    this.onTap,
  });

  final double width;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(AppImages.food1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jollof Hut',
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      const Gap(5),
                      Text(
                        '4.5 (2.5k).Local Dishes',
                        style: context.$style.titleSmall!.copyWith(
                          color: AppColors.dark2,
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    '30-45mins',
                    style: context.$style.titleSmall!.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
