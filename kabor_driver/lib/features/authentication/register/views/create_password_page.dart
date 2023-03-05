import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

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
                'Create a password ',
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(5),
              Text(
                'Secure your account',
                style: context.$style.titleMedium,
              ),
              const Gap(20),
              const AppTextField(
                prefixIcon: Icon(
                  Iconsax.lock_14,
                  color: AppColors.dark,
                ),
                hintText: 'Minimum of 8 characters',
              ),
              const Spacer(),
              SolidButton(
                text: 'Save',
                onPressed: () => context.pushNamed(AppRoutes.authWelcome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
