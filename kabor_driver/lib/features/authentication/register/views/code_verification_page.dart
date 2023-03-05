import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeVerificationPage extends StatelessWidget {
  const CodeVerificationPage({super.key});

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
                "What's your number ?",
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(20),
              RichText(
                text: TextSpan(
                  text: 'Enter the code sent to ',
                  style: context.$style.titleMedium,
                  children: [
                    TextSpan(
                      text: '+234 849 897 68',
                      style: context.$style.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(10),
              PinCodeTextField(
                appContext: context,
                length: 4,
                animationType: AnimationType.scale,
                animationDuration: const Duration(milliseconds: 300),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // errorAnimationController: errorController, // Pass it here
                keyboardType: TextInputType.number,
                useHapticFeedback: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                pinTheme: PinTheme(
                  activeColor: AppColors.dark,
                  inactiveColor: AppColors.dark,
                  selectedColor: AppColors.dark,
                ),
                onChanged: (value) {},
              ),
              const Gap(5),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Didn't receive code ? ",
                    style: context.$style.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Resend code',
                        style: context.$style.titleMedium!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SolidButton(
                text: 'Next',
                onPressed: () => context.pushNamed(AppRoutes.fullName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
