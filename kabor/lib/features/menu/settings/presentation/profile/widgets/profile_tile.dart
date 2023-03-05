import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.text,
    this.isDanger = false,
  });

  final IconData icon;
  final String text;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: isDanger ? const Color(0xFFE53535) : const Color(0xFF333333),
        ),
        const Gap(10),
        Text(
          text,
          style: context.$style.bodyMedium?.copyWith(
            fontWeight: isDanger ? FontWeight.w600 : FontWeight.w400,
            color: isDanger ? const Color(0xFFE53535) : const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}
