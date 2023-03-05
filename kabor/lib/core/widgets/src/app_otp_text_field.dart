import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kabor/core/core.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppOtpTextField extends StatelessWidget {
  const AppOtpTextField({
    super.key,
    this.otpController,
    this.onCompleted,
  });

  final TextEditingController? otpController;
  final ValueChanged<String>? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: otpController,
      animationType: AnimationType.scale,
      cursorColor: AppColors.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // errorAnimationController: errorController, // Pass it here
      keyboardType: TextInputType.number,
      useHapticFeedback: true,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      pinTheme: PinTheme(
        activeColor: AppColors.dark,
        inactiveColor: AppColors.dark,
        selectedColor: AppColors.dark,
      ),
      onCompleted: onCompleted,
      onChanged: (value) {},
    );
  }
}
