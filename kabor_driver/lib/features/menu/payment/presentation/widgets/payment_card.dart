import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/core.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.icon,
    required this.text,
    this.isSend = false,
    this.onTap,
  });

  final IconData icon;
  final bool isSend;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: isSend
                  ? const EdgeInsets.only(right: 25)
                  : const EdgeInsets.only(left: 25),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const Gap(10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.$style.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
