import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change your password',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(5),
            Text(
              'Reset your password',
              style: context.$style.bodyMedium?.copyWith(),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                children: const [
                  AppTextField(
                    hintText: 'Old Password',
                    prefixIcon: Icon(Iconsax.lock),
                    suffixIcon: Icon(Iconsax.close_circle),
                  ),
                  Gap(20),
                  AppTextField(
                    hintText: 'New Password',
                    prefixIcon: Icon(Iconsax.lock),
                    suffixIcon: Icon(Iconsax.close_circle),
                  ),
                ],
              ),
            ),
            SolidButton(
              text: 'Update',
              onPressed: () {},
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
