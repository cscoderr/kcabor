import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onAddressPressed,
    this.hasSuffix = true,
  });

  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onAddressPressed;
  final bool hasSuffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        labelText: labelText,
        hintStyle: context.$style.bodyText1!.copyWith(
          color: AppColors.dark4,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefixIcon ??
            const Icon(
              Iconsax.search_normal_1,
            ),
        suffixIcon: hasSuffix
            ? GestureDetector(
                onTap: onAddressPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: AppColors.borderColor),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Iconsax.location5,
                        color: AppColors.primaryColor,
                      ),
                      Text('23 Oko Erin'),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
