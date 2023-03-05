import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kabor/core/core.dart';

typedef IntlPhone = PhoneNumber;

class IntlPhoneTextField extends StatelessWidget {
  const IntlPhoneTextField({
    super.key,
    this.initialValue,
    this.onInputChanged,
    this.onSaved,
    this.controller,
    this.validator,
    this.hintText,
    this.isWritable = true,
    this.borderSide = const BorderSide(color: AppColors.primaryColor),
    this.value,
  });

  final String? initialValue;

  final bool isWritable;

  final ValueChanged<IntlPhone>? onInputChanged;

  final ValueChanged<IntlPhone>? onSaved;

  final TextEditingController? controller;

  final String? value;

  final FormFieldValidator<String>? validator;

  final String? hintText;

  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: controller,
      onInputChanged: onInputChanged,
      validator: validator,
      isEnabled: isWritable,
      formatInput: false,
      ignoreBlank: true,
      initialValue: PhoneNumber(isoCode: 'NG', phoneNumber: initialValue),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 20,
      ),
      textStyle: context.$style.labelLarge?.copyWith(
        color: Colors.black.withOpacity(0.8),
        fontSize: 15,
      ),
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: context.$style.labelLarge?.copyWith(
        color: Colors.black.withOpacity(0.8),
        fontSize: 15,
      ),
      // initialValue: initialValue,
      maxLength: 10,
      inputDecoration: InputDecoration(
        hintStyle: context.$style.labelLarge?.copyWith(
          color: AppColors.dark4,
          fontSize: 15,
        ),
        hintText: hintText,
        labelStyle: context.$style.labelLarge?.copyWith(
          color: AppColors.dark4,
          fontSize: 15,
        ),
        counterText: '',
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        contentPadding: const EdgeInsets.only(
          bottom: 20,
          top: 20,
          // right: 25,
        ),
      ),
      onSaved: onSaved,
    );
  }
}
