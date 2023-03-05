import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/restaurant/restaurant.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FoodCard(),
        const Gap(10),
        Row(
          children: const [
            Icon(
              Iconsax.edit,
              size: 20,
            ),
            Gap(15),
            Icon(
              Iconsax.trash,
              size: 20,
            ),
            Spacer(),
            QuantityRangeButton(),
          ],
        ),
        const Gap(5),
        const Divider(),
      ],
    );
  }
}
