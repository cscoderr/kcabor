import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.arrow_left,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}
