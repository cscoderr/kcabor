import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.amount,
    required this.secondAmount,
    required this.transactionDate,
    required this.transactionTitle,
  });

  final String? transactionTitle;
  final double? amount;
  final DateTime? transactionDate;
  final double? secondAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 5,
          backgroundColor: AppColors.red,
        ),
        const Gap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionTitle ?? '',
                textAlign: TextAlign.center,
                style: context.$style.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                transactionDate.toString() ?? '29th Sept, 2022. 4:09PM',
                textAlign: TextAlign.center,
                style: context.$style.labelLarge?.copyWith(
                  color: AppColors.dark2,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount.toString() ?? 'N5000',
              textAlign: TextAlign.center,
              style: context.$style.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.red,
              ),
            ),
            Text(
              secondAmount.toString() ?? 'N295,000',
              textAlign: TextAlign.center,
              style: context.$style.labelLarge?.copyWith(
                color: AppColors.dark2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
