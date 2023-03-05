import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutePaths.categoriesDetails),
      child: AspectRatio(
        aspectRatio: 0.78,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        AppImages.service,
                        fit: BoxFit.fill,
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
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sam Oyenusi',
                      style: context.$style.labelLarge!.copyWith(
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
                          '3.5(200). Repairs    ',
                          style: context.$style.titleSmall!.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Electrician',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/userss.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
