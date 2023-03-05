import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              const Gap(20),
              Text(
                'Enter Referal Code',
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(20),
              Text(
                'Enter referral code if you are were invited to kabor else you can skip this question',
                style: context.$style.titleMedium,
              ),
              const Gap(10),
              const AppTextField(
                prefixIcon: Icon(
                  Iconsax.share,
                  color: AppColors.dark,
                ),
                hintText: 'Enter referral code ',
              ),
              const Spacer(),
              SolidButton(
                text: 'Next',
                onPressed: () =>
                    context.pushNamed(AppRoutes.termsAndConditions),
              ),
              const Gap(10),
              AdaptiveTextButton(
                text: 'Skip',
                onPressed: () =>
                    context.pushNamed(AppRoutes.termsAndConditions),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
