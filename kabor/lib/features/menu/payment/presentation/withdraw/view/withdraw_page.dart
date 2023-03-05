import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Withdraw'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const AppTextField(
                    hintText: 'Amount',
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: AppColors.dark,
                    ),
                  ),
                  const Gap(20),
                  SelectBox(
                    value: '',
                    onChanged: (value) {},
                    items: const [
                      SelectBoxItem(
                        value: '',
                        child: Text('Select Bank'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SolidButton(
              text: 'Withdraw',
              onPressed: () => context.pushNamed(AppRoutes.requestForm),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
