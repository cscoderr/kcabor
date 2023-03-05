import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class OrderReviewCard extends StatelessWidget {
  const OrderReviewCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child: child),
          const Icon(
            Iconsax.arrow_right_3,
            size: 18,
          ),
        ],
      ),
    );
  }
}
