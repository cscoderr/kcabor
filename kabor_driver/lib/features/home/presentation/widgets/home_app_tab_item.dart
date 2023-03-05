import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/core.dart';

class HomeAppTabTile extends StatelessWidget {
  const HomeAppTabTile({
    super.key,
    this.isActive = false,
    required this.icon,
    required this.text,
  });

  final bool isActive;
  final String text;
  final IconData icon;

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : Colors.black,
          ),
          const Gap(10),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isActive ? Colors.white : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

class HomeAppTabItem {
  HomeAppTabItem({
    // required this.currentIndex,
    required this.text,
    required this.icon,
  });
  // final int currentIndex;
  final String text;
  final IconData icon;
}
