import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.hasTrailing = true,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool hasTrailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(
            Iconsax.location,
            color: AppColors.primaryColor,
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.$style.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: context.$style.titleSmall!.copyWith(
                      color: AppColors.dark2,
                    ),
                  ),
              ],
            ),
          ),
          if (hasTrailing) const Icon(Iconsax.send),
        ],
      ),
    );
  }
}
