import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class AuthWelcomePage extends StatelessWidget {
  const AuthWelcomePage({super.key});

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
                'Welcome Munah,',
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(5),
              Text(
                'What will you like to do today?',
                style: context.$style.titleMedium,
              ),
              const Gap(40),
              Center(child: SvgPicture.asset(AppImages.mainWelcome)),
              const Spacer(),
              SolidButton(
                text: 'Order Food',
                color: AppColors.backgroundLightColor3,
                textColor: AppColors.primaryColor,
                border: BorderSide.none,
                onPressed: () => context.pushNamed(AppRoutes.tab),
              ),
              const Gap(10),
              SolidButton(
                text: 'Take a ride',
                color: AppColors.backgroundLightColor3,
                textColor: AppColors.primaryColor,
                border: BorderSide.none,
                onPressed: () {},
              ),
              const Gap(10),
              SolidButton(
                text: 'Book an Artisan',
                color: AppColors.backgroundLightColor3,
                textColor: AppColors.primaryColor,
                border: BorderSide.none,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
