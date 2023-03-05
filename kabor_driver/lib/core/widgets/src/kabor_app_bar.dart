import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

class KaborAppBar extends StatelessWidget with PreferredSizeWidget {
  const KaborAppBar({
    super.key,
    required this.title,
    this.hasBackButton = true,
    this.leading,
    this.trailing,
    this.textColor = AppColors.dark,
  });

  final String title;
  final Widget? trailing;
  final Color textColor;
  final Widget? leading;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            if (hasBackButton) leading ?? const AppBackButton(),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            trailing ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
