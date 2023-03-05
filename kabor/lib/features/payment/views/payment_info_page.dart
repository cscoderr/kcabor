import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class PaymentInfoPage extends StatelessWidget {
  const PaymentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add a payment info',
                textAlign: TextAlign.left,
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(5),
              RichText(
                text: TextSpan(
                  text: 'Enter code sent to ',
                  style: context.$style.titleMedium,
                  children: [
                    TextSpan(
                      text: 'tommy@gmail.com',
                      style: context.$style.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Iconsax.card,
                        color: AppColors.dark,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Debit Card ',
                      style: context.$style.titleMedium,
                    ),
                    const Spacer(),
                    const Icon(Iconsax.arrow_right_3),
                  ],
                ),
              ),
              const Spacer(),
              AdaptiveTextButton(
                text: 'Skip',
                onPressed: () => context.pushNamed(AppRoutes.addCard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
