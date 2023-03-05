import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/theme/src/app_colors.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkResponse(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/images/back_button.svg'),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Ratings and Reviews',
                        style: context.$style.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Center(
                child: Text(
                  '4.5',
                  style: context.$style.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Gap(5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Iconsax.star1,
                      color: AppColors.yellowColor,
                    ),
                    Gap(3),
                    Icon(
                      Iconsax.star1,
                      color: AppColors.yellowColor,
                    ),
                    Gap(3),
                    Icon(
                      Iconsax.star1,
                      color: AppColors.yellowColor,
                    ),
                    Gap(3),
                    Icon(
                      Iconsax.star1,
                      color: AppColors.yellowColor,
                    ),
                    Gap(3),
                    Icon(
                      Iconsax.star1,
                      color: AppColors.lightGreyColor,
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Center(
                child: Text('20 Ratings', style: context.$style.bodyMedium),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Uriah A',
                    style: context.$style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(3),
              Text(
                '14-09-2022  ',
                style: context.$style.bodyLarge!.copyWith(),
              ),
              const Gap(3),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut gkakhkdkdnaliquam, purus sit amet luctus venenatis',
                style: context.$style.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Uriah A',
                    style: context.$style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(3),
              Text(
                '14-09-2022  ',
                style: context.$style.bodyLarge!.copyWith(),
              ),
              const Gap(3),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut gkakhkdkdnaliquam, purus sit amet luctus venenatis',
                style: context.$style.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sandra Bailey ',
                    style: context.$style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(3),
              Text(
                '14-09-2022  ',
                style: context.$style.bodyLarge!.copyWith(),
              ),
              const Gap(3),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut gkakhkdkdnaliquam, purus sit amet luctus venenatis',
                style: context.$style.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Uriah Amorin',
                    style: context.$style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(3),
              Text(
                '14-09-2022  ',
                style: context.$style.bodyLarge!.copyWith(),
              ),
              const Gap(3),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut gkakhkdkdnaliquam, purus sit amet luctus venenatis',
                style: context.$style.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Omolara Johnson ',
                    style: context.$style.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.yellowColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                      Icon(
                        Iconsax.star1,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  )
                ],
              ),
              const Gap(3),
              Text(
                '14-09-2022  ',
                style: context.$style.bodyLarge!.copyWith(),
              ),
              const Gap(3),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut gkakhkdkdnaliquam, purus sit amet luctus venenatis',
                style: context.$style.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
