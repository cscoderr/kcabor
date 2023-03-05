import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

extension BookTableEx on BuildContext {
  void showBookATableDialog() {
    showDialog<void>(
      context: this,
      builder: (context) => SimpleDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Would you like to make \n reservation with Poached ? ',
                    style: context.$style.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SvgPicture.asset(AppImages.bookTable),
              ],
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SolidButton(
              text: 'Yes, I would love that ',
              onPressed: () => context.pushNamed(AppRoutes.bookTable),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AdaptiveTextButton(
              text: 'No, thanks ',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
