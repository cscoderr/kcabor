import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/core.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
    this.hasClose = false,
    this.direction = Axis.vertical,
  });
  final String image;
  final String text;
  final Axis direction;
  final bool hasClose;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Flex(
        direction: direction,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFFFFCD99),
            child: Image.asset(image),
          ),
          const Gap(10),
          Expanded(
            child: Text(text),
          ),
          if (direction == Axis.horizontal && hasClose)
            Text(
              'Closed',
              style: context.$style.bodyText1!.copyWith(
                color: AppColors.errorColor,
              ),
            ),
        ],
      ),
    );
  }
}
