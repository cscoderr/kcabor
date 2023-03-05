import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

/// {@template input_box}
/// InputBox similar to textfield
/// {@endtemplate}
class DateInputBox extends StatelessWidget {
  ///@macro TextBox Constructor
  const DateInputBox({
    super.key,
    // this.controller,
    this.validator,
    this.hintText,
    this.labelText,
    this.errorText,
    this.icon,
    this.leadingIcon,
    this.leadingColor = AppColors.dark,
    this.fillColor = Colors.white,
    this.maxLength,
    this.inputFormat,
    this.inputType,
    this.isPassword = false,
    this.raduis = 10.0,
    this.borderSide = const BorderSide(color: AppColors.primaryColor),
    this.iconSize = 24.0,
    this.isWritable = true,
    this.enablePrefix = true,
    this.onChanged,
    this.mode = DateTimeFieldPickerMode.date,
    this.value,
    this.onFieldSubmitted,
    this.focus,
    this.lastDate,
    this.onIconClick,
  });

  ///@macro TextEditingController fields
  // final TextEditingController? controller;

  ///@macro Validator fields
  final FormFieldValidator<DateTime?>? validator;

  ///@macro HintText
  final String? hintText;

  ///@macro Label Text
  final String? labelText;

  ///@macro Error Text
  final String? errorText;

  ///@macro Icon
  final IconData? icon;

  ///@macro Leading Icon
  final IconData? leadingIcon;

  ///@macro Max Length
  final int? maxLength;

  ///@macro InputForm
  final List<TextInputFormatter>? inputFormat;

  ///@macro Input Type
  final TextInputType? inputType;

  ///@macro IsPassword either true/false
  final bool isPassword;

  ///@macro InputBox Border Raduis
  final double raduis;

  ///@macro BorderSide
  final BorderSide borderSide;

  ///@macro Icon Size
  final double iconSize;

  ///@macro Iswritable true/false
  final bool isWritable;

  ///
  final DateTimeFieldPickerMode mode;

  ///@macro onIconClick
  final VoidCallback? onIconClick;

  ///@macro LeadingIcon Color
  final Color leadingColor;

  ///@macro TextBox Background Color
  final Color fillColor;

  ///@macro Enable Prefix Icon true/false
  final bool enablePrefix;

  final DateTime? value;

  ///@macro OnChange function
  final ValueChanged<DateTime>? onChanged;

  ///@macro onFieldSubmitted field submitted function
  final ValueChanged<String>? onFieldSubmitted;

  ///@macro TextBox Focus
  final FocusNode? focus;

  ///
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      enabled: isWritable,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onDateSelected: onChanged,
      mode: mode,
      lastDate: lastDate ?? DateTime.now().subtract(const Duration(days: 6368)),
      initialValue: value,
      decoration: InputDecoration(
        hintStyle: context.$style.caption?.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: context.$style.caption?.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        fillColor: fillColor,
        filled: true,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 20,
          bottom: 20,
          top: 20,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: mode == DateTimeFieldPickerMode.time
              ? const Icon(Iconsax.clock)
              : const Icon(Iconsax.calendar_1),
        ),
      ),
    );
  }
}
