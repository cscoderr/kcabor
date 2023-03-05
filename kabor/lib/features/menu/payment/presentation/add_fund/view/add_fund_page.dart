import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AddFundPage extends StatelessWidget {
  const AddFundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Add Funds'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Choose your preferred method ',
                style: context.$style.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(20),
            AddFundCard(
              text: 'Debit Card',
              icon: Iconsax.card,
              onTap: () => context.pushNamed(AppRoutes.requestFund),
            ),
            const Gap(20),
            AddFundCard(
              text: 'Request Fund',
              icon: Iconsax.direct_inbox,
              onTap: () => context.pushNamed(AppRoutes.requestFund),
            ),
          ],
        ),
      ),
    );
  }
}

class AddFundCard extends StatelessWidget {
  const AddFundCard({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                icon,
                color: AppColors.dark,
              ),
            ),
            const Gap(20),
            Text(
              text,
              style: context.$style.titleMedium,
            ),
            const Spacer(),
            const Icon(Iconsax.arrow_right_3),
          ],
        ),
      ),
    );
  }
}
