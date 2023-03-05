import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class CompleteRiderPage extends StatelessWidget {
  const CompleteRiderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.rideComplete),
            const Gap(30),
            Text(
              'Your Earnings from Pelumi’s ride ',
              style: context.$style.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const Gap(10),
            Text(
              'N3500',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            Text(
              'Rate Pelumi',
              style: context.$style.labelLarge,
            ),
            const Gap(5),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              allowHalfRating: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Iconsax.star1,
                color: AppColors.yellowColor,
              ),
              onRatingUpdate: print,
            ),
          ],
        ),
      ),
    );
  }
}
