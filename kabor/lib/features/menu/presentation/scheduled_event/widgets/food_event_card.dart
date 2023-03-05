import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class FoodEventCard extends StatelessWidget {
  const FoodEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor4,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(AppImages.food1),
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Poached -GRA, Ilorin',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(5),
              Text(
                'Tue,21 Sept, 6:00PM',
                style: context.$style.labelLarge?.copyWith(),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 16,
                  ),
                  Text(
                    '2',
                    style: context.$style.bodySmall?.copyWith(),
                  ),
                  const Gap(3),
                  Text(
                    'Table no: 2',
                    style: context.$style.bodySmall?.copyWith(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
