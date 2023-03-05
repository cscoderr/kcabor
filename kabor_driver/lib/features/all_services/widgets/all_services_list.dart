import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/core/theme/src/app_colors.dart';

class AllServicesCard extends StatelessWidget {
  const AllServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        mainAxisExtent: 250,
      ),
      itemCount: 11,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.pushNamed(AppRoutePaths.categoriesDetails),
          child: Container(
            height: 230,
            width: 169,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 139,
                      width: 169,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/render_service.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: 5,
                      child: Container(
                        height: 24,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff3DA925),
                        ),
                        child: Center(
                          child: Text(
                            'N500/hr',
                            style: context.$style.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sam Oyenusi',
                        style: context.$style.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(3),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.star1,
                            color: AppColors.yellowColor,
                          ),
                          const Gap(5),
                          Text(
                            '3.5(200). Repairs',
                            style: context.$style.titleSmall?.copyWith(
                              color: AppColors.dark2,
                            ),
                          ),
                        ],
                      ),
                      const Gap(2),
                      Row(
                        children: [
                          Text(
                            'Electrician',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/userss.png'),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
