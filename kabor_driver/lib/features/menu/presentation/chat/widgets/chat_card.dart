import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AppImages.chat),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Joseph',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  const Icon(Iconsax.car5, size: 14),
                  const Gap(7),
                  Text(
                    'Driver',
                    style: context.$style.bodySmall?.copyWith(
                      color: AppColors.dark2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          '1:27pm',
          style: context.$style.bodySmall?.copyWith(
            color: AppColors.dark2,
          ),
        ),
      ],
    );
  }
}
