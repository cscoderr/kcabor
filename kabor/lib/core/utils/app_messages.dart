import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

extension AppMessages on BuildContext {
  void errorMessage(String error) {
    Flushbar<void>(
      messageSize: 16,
      messageText: Text(
        error,
        style: Theme.of(this).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
      ),
      icon: const Icon(
        Iconsax.danger,
        size: 28,
        color: Colors.white,
      ),
      backgroundColor: AppColors.red,
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
    ).show(this);
  }

  void successMessage(String error) {
    Flushbar<void>(
      messageText: Text(
        error,
        style: Theme.of(this).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
      ),
      icon: const Icon(
        Iconsax.tick_circle,
        size: 28,
        color: Colors.white,
      ),
      backgroundColor: AppColors.primaryColor,
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 3),
    ).show(this);
  }
}
