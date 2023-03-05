// ignore_for_file: cascade_invocations

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.onboarding),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logoDark),
                  const Gap(10),
                  SvgPicture.asset(AppImages.logoDarkPatch),
                ],
              ),
              const Gap(20),
              Text(
                "You've already started\nmoving in the right direction.",
                textAlign: TextAlign.center,
                style: context.$style.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(20),
              Text(
                'Driving with Kabor is an easy way to\nearn money whenever ',
                textAlign: TextAlign.center,
                style: context.$style.labelLarge,
              ),
              const Gap(40),
              SolidButton(
                text: 'Login',
                onPressed: () => context.pushNamed(AppRoutes.login),
              ),
              const Gap(20),
              RichText(
                text: TextSpan(
                  text: 'Want to drive with Kabor? ',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => context.pushNamed(AppRoutes.phoneNumber),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColors.primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
