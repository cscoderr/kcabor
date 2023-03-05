import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/theme/src/app_colors.dart';

class RewardAppTabTile extends StatelessWidget {
  const RewardAppTabTile({
    super.key,
    this.isActive = false,
    required this.text,
    required this.textNum,
  });

  final bool isActive;
  final String text;
  final String textNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : const Color(0xFFDDE5E9),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xFFDDE5E9),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: isActive ? Colors.white : Colors.black,
                ),
          ),
          const Gap(5),
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive
                  ? const Color.fromARGB(255, 25, 76, 27)
                  : Colors.grey,
            ),
            child: Center(
              child: Text(
                textNum,
                style: context.$style.bodySmall!.copyWith(
                  color: isActive ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RewardAppTabItem {
  RewardAppTabItem({
    // required this.currentIndex,
    required this.textNum,
    required this.text,
  });
  // final int currentIndex;
  final String textNum;
  final String text;
}
