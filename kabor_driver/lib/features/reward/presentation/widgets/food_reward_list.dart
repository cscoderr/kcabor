import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';
import 'package:kabor_driver/core/theme/src/app_colors.dart';

class FoodReward extends StatelessWidget {
  const FoodReward({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          // margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 139,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/foodie.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: -11,
                    right: 15,
                    child: Container(
                      height: 24,
                      width: 107,
                      decoration: BoxDecoration(
                        color: const Color(0xff3DA925),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          '5% of your order',
                          style: context.$style.bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sooly’s Oatmeal - Sango, Ilorin',
                      style: context.$style.titleLarge,
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.star1,
                          color: AppColors.yellowColor,
                        ),
                        const Gap(5),
                        Text(
                          '4.5 (2.5k).Breakfast',
                          style: context.$style.titleSmall?.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                      ],
                    ),
                    const Gap(3),
                    Text(
                      '30-45mins ',
                      style: context.$style.titleSmall!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: 2,
    );
  }
}
