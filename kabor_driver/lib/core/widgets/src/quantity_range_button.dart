import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class QuantityRangeButton extends HookConsumerWidget {
  const QuantityRangeButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final range = useState(1);
    return Row(
      children: [
        InkResponse(
          onTap: () {
            if (range.value <= 1) return;
            range.value--;
          },
          radius: 10,
          child: const CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.backgroundLightColor3,
            child: Icon(
              Iconsax.minus,
              color: AppColors.secondaryColor,
              size: 18,
            ),
          ),
        ),
        const Gap(10),
        Text(
          range.value.toString(),
          style: context.$style.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const Gap(10),
        InkResponse(
          onTap: () {
            range.value++;
          },
          radius: 10,
          child: const CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.backgroundLightColor3,
            child: Icon(
              Iconsax.add,
              color: AppColors.secondaryColor,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
