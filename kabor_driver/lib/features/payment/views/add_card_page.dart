import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Add a card ',
                        textAlign: TextAlign.left,
                        style: context.$style.headline5!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(25),
              const AppTextField(
                prefixIcon: Icon(
                  Iconsax.card,
                  color: AppColors.dark,
                ),
                hintText: 'Card number',
              ),
              const Gap(15),
              Row(
                children: const [
                  Expanded(
                    child: AppTextField(
                      suffixIcon: Icon(
                        Iconsax.info_circle,
                        color: AppColors.dark,
                      ),
                      hintText: 'MM/YY',
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: AppTextField(
                      suffixIcon: Icon(
                        Iconsax.info_circle,
                        color: AppColors.dark,
                      ),
                      hintText: 'CVV',
                    ),
                  ),
                ],
              ),
              const Gap(15),
              const AppTextField(
                hintText: 'Card Pin',
              ),
              const Spacer(),
              SolidButton(
                text: 'Save',
                onPressed: () => context.pushNamed(AppRoutes.addPhoto),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
