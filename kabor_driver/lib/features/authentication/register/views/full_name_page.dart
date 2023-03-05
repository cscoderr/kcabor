import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class FullNamePage extends StatelessWidget {
  const FullNamePage({super.key});

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
                "What's your name ?",
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(20),
              Text(
                'Drivers will confirm it’s you upon arrival',
                style: context.$style.titleMedium,
              ),
              const Gap(10),
              const AppTextField(
                hintText: 'Enter your fullname',
                prefixIcon: Icon(
                  Iconsax.user,
                  color: AppColors.dark,
                ),
              ),
              const Spacer(),
              SolidButton(
                text: 'Next',
                onPressed: () => context.pushNamed(AppRoutes.email),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
