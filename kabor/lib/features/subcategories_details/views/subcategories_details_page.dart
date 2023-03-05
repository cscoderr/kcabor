import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/router/app_route_paths.dart';
import 'package:kabor/core/theme/src/app_colors.dart';
import 'package:kabor/core/widgets/src/app_back_button.dart';
import 'package:kabor/core/widgets/src/custom_button.dart';

class SubCategoriesDetails extends StatelessWidget {
  const SubCategoriesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 216,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/cateogories_upper_img.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: -30,
                    left: 30,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/mama.png'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppBackButton(),
                      SvgPicture.asset('assets/images/info.svg'),
                    ],
                  ),
                  const Gap(200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Patricia Johnson',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'N500/hr',
                        style: context.$style.titleLarge!
                            .copyWith(color: const Color(0xff3DA925)),
                      )
                    ],
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Iconsax.star1,
                            color: AppColors.yellowColor,
                          ),
                          const Gap(5),
                          Text(
                            '3.5(200).Salon',
                            style: context.$style.bodyLarge!.copyWith(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.location),
                          const Gap(5),
                          Text(
                            'Fate Road, Ilorin, Nigeria ',
                            style: context.$style.bodyLarge!.copyWith(
                              color: const Color(0xff3DA925),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'Hairstylist',
                    style: context.$style.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff3DA925),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Description',
                    style: context.$style.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'I’m a professional hairstylist of over several years of experience, I provide the best quality of service. Be sure to get the best service from me . I’m a professional hairstylist of over several years of experience, I provide the best quality of service. Be sure to get the best service from me .',
                    style: context.$style.bodySmall,
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: context.$style.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            context.pushNamed(AppRoutePaths.reviews),
                        child: Text(
                          'See all',
                          style: context.$style.bodyLarge!.copyWith(
                            color: const Color(0xff3DA925),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
                  const Gap(5),
                  Text(
                    '14-09-2022  ',
                    style: context.$style.bodyLarge!.copyWith(),
                  ),
                  const Gap(5),
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
                  const Gap(5),
                  Text(
                    '14-09-2022  ',
                    style: context.$style.bodyLarge!.copyWith(),
                  ),
                  const Gap(5),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut gkakhkdkdnaliquam, purus sit amet luctus venenatis',
                    style: context.$style.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  MyCustombutton(
                    text: 'Book Now',
                    onTap: () => context.pushNamed(AppRoutePaths.bookings),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
