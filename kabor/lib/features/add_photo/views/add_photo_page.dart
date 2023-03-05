import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AddPhotoPage extends StatelessWidget {
  const AddPhotoPage({super.key});

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
              const Gap(30),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFE3EDFF),
                  child: Icon(
                    Iconsax.user,
                    color: AppColors.primaryColor,
                    size: 35,
                  ),
                ),
              ),
              const Gap(30),
              Text(
                'Take a photo',
                textAlign: TextAlign.left,
                style: context.$style.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(15),
              Text(
                '''Your photo will be used by your driver to identify you for your orders. Drivers can only view your photo during pickup and will not be able to access it once the ride is completed''',
                style: context.$style.titleMedium,
              ),
              const Spacer(),
              SolidButton(
                text: 'Take Photo',
                onPressed: () => context.pushNamed(AppRoutes.email),
              ),
              const Gap(5),
              AdaptiveTextButton(
                text: 'Skip',
                onPressed: () => context.pushNamed(AppRoutes.createPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
