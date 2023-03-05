import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/order/presentation/review/review.dart';

class OrderReviewPage extends StatelessWidget {
  const OrderReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Review your delivery order  ',
                        style: context.$style.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your information',
                      style: context.$style.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(10),
                    OrderReviewCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Info ',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'Awotundun Memunah ',
                            style: context.$style.labelLarge!.copyWith(
                              color: AppColors.dark2,
                            ),
                          ),
                          const Gap(2),
                          Text(
                            '+234 81 073 45192 ',
                            style: context.$style.labelLarge!.copyWith(
                              color: AppColors.dark2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    OrderReviewCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery to ',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            '45, Awotundun Street, Lagos ',
                            style: context.$style.labelLarge!.copyWith(
                              color: AppColors.dark2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Your Payment',
                      style: context.$style.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(10),
                    OrderReviewCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter promo  code ',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                          const Gap(5),
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.card),
                              const Gap(5),
                              Text(
                                'Card 1226** ',
                                style: context.$style.titleSmall!.copyWith(
                                  color: AppColors.dark2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Gap(20),
                    OrderReviewCard(
                      child: Text(
                        'Enter promo  code ',
                        style: context.$style.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SolidButton(
                text: 'Place Your Order - NGN 11,500',
                onPressed: () =>
                    context.pushNamed(AppRoutes.restaurantTracking),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
