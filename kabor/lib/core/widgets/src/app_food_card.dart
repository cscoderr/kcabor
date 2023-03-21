import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AppFoodCard extends HookConsumerWidget {
  const AppFoodCard({
    super.key,
    this.width = 230,
    this.onTap,
    required this.name,
    required this.image,
    required this.restaurantName,
    required this.rating,
  });

  final double width;
  final VoidCallback? onTap;
  final String image;
  final String name;
  final String restaurantName;
  final String rating;

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
                image: DecorationImage(
                  image: NetworkImage(image),
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
                    name,
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
                        '$rating (2.5k)-$restaurantName',
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
