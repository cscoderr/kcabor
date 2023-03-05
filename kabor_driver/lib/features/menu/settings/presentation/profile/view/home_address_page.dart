import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class HomeAddressPage extends StatelessWidget {
  const HomeAddressPage({Key? key}) : super(key: key);

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
              'Add a home address',
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(5),
            Text(
              'Add your work address',
              style: context.$style.bodyMedium?.copyWith(),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                children: const [
                  AppTextField(
                    hintText: 'Add a home address ',
                    prefixIcon: Icon(Iconsax.location),
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
