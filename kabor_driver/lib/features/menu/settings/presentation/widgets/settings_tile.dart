import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.text,
    required this.icon,
    this.trailingText,
    this.isLogout = false,
    this.hasTrailingText = false,
    this.hasLeadingIcon = true,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final bool isLogout;
  final bool hasTrailingText;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool hasLeadingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(),
        padding: isLogout
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
            : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            if (hasLeadingIcon)
              Icon(
                icon,
                color: isLogout ? AppColors.red : AppColors.dark,
              ),
            const Gap(20),
            Expanded(
              child: Text(
                text,
                style: context.$style.labelLarge?.copyWith(
                  color: isLogout ? AppColors.red : AppColors.dark,
                ),
              ),
            ),
            if (hasTrailingText)
              Text(
                trailingText ?? '',
                style: context.$style.bodySmall?.copyWith(
                  color: AppColors.dark,
                ),
              ),
            if (!isLogout) const Icon(Iconsax.arrow_right_3),
          ],
        ),
      ),
    );
  }
}

class SettingsSubmenuTile extends StatelessWidget {
  const SettingsSubmenuTile({
    super.key,
    required this.text,
    this.trailingText,
    this.onTap,
    this.onChanged,
    this.isChecked = false,
    this.hasSwitch = false,
    this.hasCheckbox = false,
  });

  final String text;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool isChecked;
  final bool hasSwitch;
  final bool hasCheckbox;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: context.$style.labelLarge?.copyWith(
                  color: AppColors.dark,
                ),
              ),
            ),
            if (hasSwitch)
              Switch.adaptive(
                value: isChecked,
                onChanged: onChanged,
              ),
            if (hasCheckbox)
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isChecked ? AppColors.primaryColor : Colors.white,
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: Checkbox(
                  value: isChecked,
                  checkColor: Colors.white,
                  fillColor: isChecked
                      ? MaterialStateProperty.all(AppColors.primaryColor)
                      : MaterialStateProperty.all(Colors.white),
                  onChanged: onChanged,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
