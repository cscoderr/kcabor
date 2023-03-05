import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class WorkAddressPage extends StatelessWidget {
  const WorkAddressPage({Key? key}) : super(key: key);

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
              'Add your work email',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(5),
            Text(
              'We’ll send your work trip receipts to this mail',
              style: context.$style.bodyMedium?.copyWith(),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                children: const [
                  AppTextField(
                    hintText: 'Enter your mail',
                    prefixIcon: Icon(Iconsax.sms),
                  ),
                ],
              ),
            ),
            SolidButton(
              text: 'Submit',
              onPressed: () {},
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
