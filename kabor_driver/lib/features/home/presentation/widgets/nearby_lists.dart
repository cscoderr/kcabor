import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/core/theme/src/app_colors.dart';

class NearbyServices extends StatelessWidget {
  const NearbyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const ServiceCard();
      },
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
