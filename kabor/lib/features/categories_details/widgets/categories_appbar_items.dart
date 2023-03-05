import 'package:flutter/material.dart';
import 'package:kabor/core/theme/src/app_colors.dart';

class CategoriesAppTabTile extends StatelessWidget {
  const CategoriesAppTabTile({
    super.key,
    this.isActive = false,
    required this.text,
  });

  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : const Color(0xFFDDE5E9),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xFFDDE5E9),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isActive ? Colors.white : Colors.black,
            ),
      ),
    );
  }
}

class CategoriesAppTabItem {
  CategoriesAppTabItem({
    // required this.currentIndex,
    required this.text,
  });
  // final int currentIndex;
  final String text;
}
