import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class OrderContactPage extends StatelessWidget {
  const OrderContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const AppCloseButton(
                    color: AppColors.primaryColor2,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Contact Information',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Expanded(
                child: Column(
                  children: [
                    const AppTextField(
                      hintText: 'Enter your full name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    const Gap(20),
                    const AppTextField(
                      hintText: 'Enter phone numbber',
                      prefixIcon: Icon(Iconsax.call),
                    ),
                    const Gap(20),
                    const AppTextField(
                      prefixIcon: Icon(Iconsax.location),
                      hintText: 'Enter address',
                    ),
                    const Gap(20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLightColor3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text('Save address to my account '),
                          ),
                          Switch.adaptive(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              SolidButton(
                text: 'Review Order ',
                onPressed: () => context.pushNamed(AppRoutes.orderReview),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
