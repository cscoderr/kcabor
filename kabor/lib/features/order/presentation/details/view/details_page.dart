import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/order/order.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Text(
                    'Order Details ',
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const AppAddButton(),
                ],
              ),
              const Gap(30),
              Expanded(
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Gap(20),
                        itemBuilder: (BuildContext context, int index) {
                          return const OrderDetailsCard();
                        },
                      ),
                    ),
                    const Gap(20),
                    const OrderMethodCard(),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Items subtotal',
                            style: context.$style.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'NGN 11,000',
                          style: context.$style.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Delivery Fee',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.dark2,
                            ),
                          ),
                        ),
                        Text(
                          'NGN 500',
                          style: context.$style.titleSmall!.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              SolidButton(
                text: 'Continue to checkout',
                onPressed: () => context.pushNamed(AppRoutes.orderContact),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
