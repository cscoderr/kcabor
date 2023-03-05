import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: AppLogo(),
              ),
              const Gap(30),
              Text(
                'Login',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(2),
              Text(
                'Type in all your details to login',
                style: context.$style.labelLarge,
              ),
              const Gap(20),
              Text(
                'Email/Phone',
                style: context.$style.bodySmall,
              ),
              const Gap(5),
              const AppTextField(
                hintText: 'Enter your phone or email',
                prefixIcon: Icon(
                  Iconsax.sms,
                  color: AppColors.dark4,
                ),
              ),
              const Gap(20),
              Text(
                'Password',
                style: context.$style.bodySmall,
              ),
              const Gap(5),
              const AppTextField(
                hintText: 'Enter your password ',
                prefixIcon: Icon(
                  Iconsax.lock,
                  color: AppColors.dark4,
                ),
              ),
              const Gap(30),
              SolidButton(
                text: 'Log in',
                onPressed: () => context.pushNamed(AppRoutes.authWelcome),
              ),
              const Gap(20),
              SolidButton(
                color: AppColors.dark,
                border: BorderSide.none,
                onPressed: () => context.pushNamed(AppRoutes.authWelcome),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.apple),
                    const Gap(20),
                    Text(
                      'Log In with Apple',
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: Image.asset(
                        AppIcons.facebook,
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.google,
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have a Kaabor account ? ",
                    style: context.$style.titleSmall,
                    children: [
                      TextSpan(
                        text: 'Create account',
                        style: context.$style.titleSmall!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => context.pushNamed(AppRoutes.phoneNumber),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
