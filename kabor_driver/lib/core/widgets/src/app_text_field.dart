import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.onTap,
    this.radius = 8,
    this.autocorrectEnabled = true,
  });

  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Icon? suffixIcon;
  final bool enabled;
  final double radius;
  final bool autocorrectEnabled;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      onChanged: onChanged,
      onTap: onTap,
      autocorrect: autocorrectEnabled,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: context.$style.bodyText1!.copyWith(
          color: AppColors.dark4,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        prefixIcon: prefixIcon ??
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: prefix,
            ),
        // prefix: prefix,
        suffixIcon: suffix ?? suffixIcon,
      ),
    );
  }
}
