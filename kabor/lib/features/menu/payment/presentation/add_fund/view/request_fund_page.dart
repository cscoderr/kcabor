import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';

class RequestFundPage extends HookConsumerWidget {
  const RequestFundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = useState('0');
    return Scaffold(
      appBar: const KaborAppBar(title: 'Request Fund'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Enter the amount you will to request for ',
                style: context.$style.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(20),
            Text(
              '${AppConstants.ngnSymbol} ${amount.value.formatNumber}',
              style: context.$style.titleLarge?.copyWith(
                color: AppColors.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Gap(50),
            AppKeypad(
              onTap: (value) {
                amount.value = value;
              },
            ),
            SolidButton(
              text: 'Request',
              onPressed: () => context.pushNamed(AppRoutes.requestForm),
            ),
          ],
        ),
      ),
    );
  }
}
