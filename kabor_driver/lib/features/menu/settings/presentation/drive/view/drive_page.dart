import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/core.dart';

class DrivePage extends StatelessWidget {
  const DrivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up to drive ',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(5),
            Text(
              "Get there with Kabor whether you're making rent, saving for the future, or just in need of some extra money.",
              style: context.$style.bodyMedium?.copyWith(),
            ),
            const Gap(20),
            AppTextField(
              hintText: 'Your city',
            ),
            SolidButton(
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
