import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

typedef SelectBoxItem<T> = DropdownMenuItem<T>;

class SelectBox<T> extends StatelessWidget {
  const SelectBox({
    super.key,
    @required this.items,
    this.validator,
    this.radius = 10.0,
    this.value,
    this.onChanged,
    this.icon,
    this.label,
    this.borderSide = const BorderSide(color: AppColors.primaryColor),
  });

  final List<SelectBoxItem<T>>? items;
  final FormFieldValidator<dynamic>? validator;
  final double radius;
  final dynamic value;
  final ValueSetter<T?>? onChanged;
  final BorderSide borderSide;
  final Widget? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value as T,
      items: items,
      isExpanded: true,
      validator: validator,
      decoration: InputDecoration(
        hintStyle: context.$style.bodyText1?.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: context.$style.bodyText1?.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        labelText: label,
        prefixIcon: icon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 10,
          bottom: 15,
          top: 15,
          right: 10,
        ),
      ),
      onChanged: onChanged,
      dropdownColor: Colors.white,
      style: context.$style.bodyText1?.copyWith(
        color: Colors.black,
      ),
      iconEnabledColor: Colors.black,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 25,
        color: AppColors.dark2,
      ),
    );
  }
}
