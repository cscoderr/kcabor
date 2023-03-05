import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({
    super.key,
    this.color = AppColors.primaryColor2,
    this.onTap,
  });

  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
        child: const Icon(
          Icons.close,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppFilterButton extends StatelessWidget {
  const AppFilterButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.setting_4,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppInfoButton extends StatelessWidget {
  const AppInfoButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.info_circle,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppCallButton extends StatelessWidget {
  const AppCallButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.call,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppEditButton extends StatelessWidget {
  const AppEditButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.edit_2,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppAddButton extends StatelessWidget {
  const AppAddButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.add,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppExportButton extends StatelessWidget {
  const AppExportButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primaryColor2,
        child: Icon(
          Iconsax.export,
          color: AppColors.dark,
          size: 16,
        ),
      ),
    );
  }
}

class AppSearchButton extends StatelessWidget {
  const AppSearchButton({
    super.key,
    this.onTap,
    this.radius = 20,
    this.iconSize = 20,
  });

  final VoidCallback? onTap;
  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Iconsax.search_normal_1,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
