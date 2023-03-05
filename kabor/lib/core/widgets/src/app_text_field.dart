import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kabor/core/core.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.onTap,
    this.radius = 8,
    this.validator,
    this.obsecureText,
    this.inputFormatters,
    this.keyboardType,
    this.autovalidateMode,
    this.autocorrectEnabled = true,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obsecureText;
  final Widget? suffixIcon;
  final bool enabled;
  final double radius;
  final bool autocorrectEnabled;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      validator: validator,
      obscureText: obsecureText ?? false,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      onTap: onTap,
      autocorrect: autocorrectEnabled,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: context.$style.bodyLarge!.copyWith(
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
