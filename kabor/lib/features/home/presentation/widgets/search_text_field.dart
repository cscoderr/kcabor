import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/home.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.fillColor,
    this.onTap,
  });

  final Color? fillColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: fillColor ?? Colors.transparent,
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Row(
                children: const [
                  Icon(
                    Iconsax.search_normal_1,
                    color: AppColors.dark2,
                  ),
                  Gap(10),
                  Text('Search'),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.showAddressDialog(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: fillColor ?? Colors.transparent,
              border: const Border.symmetric(
                horizontal: BorderSide(
                  color: AppColors.borderColor,
                ),
              ).add(
                const Border(
                  right: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
              ),
              // borderRadius: const BorderRadius.only(
              //   topRight: Radius.circular(8),
              //   bottomRight: Radius.circular(8),
              // ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Iconsax.location5,
                    color: AppColors.primaryColor,
                  ),
                  Text('23 Oko Erin'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
