import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class CompleteRiderPage extends StatelessWidget {
  const CompleteRiderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Complete Ride',
        leading: AppCloseButton(
          color: AppColors.primaryColor2,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AppImages.food1),
                      ),
                      const Gap(20),
                      Text(
                        'Thanks for riding! Rate Joseph',
                        style: context.$style.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Gap(20),
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
                      const Gap(20),
                      SelectBox(
                        value: '',
                        items: [
                          SelectBoxItem(
                            value: '',
                            child: Text(
                              'Rating Suggestion',
                              style: context.$style.bodySmall?.copyWith(),
                            ),
                          ),
                        ],
                      ),
                      const Gap(40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Payment',
                          style: context.$style.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.card,
                          ),
                          const Gap(5),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Card 1226** ',
                                  style: context.$style.labelLarge?.copyWith(
                                    color: AppColors.dark2,
                                  ),
                                ),
                                const Icon(
                                  Iconsax.arrow_down_1,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'N3500',
                            style: context.$style.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SolidButton(
                onPressed: () {},
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
