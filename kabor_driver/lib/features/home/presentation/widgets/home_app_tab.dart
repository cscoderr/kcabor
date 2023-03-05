import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/features/home/home.dart';

class HomeAppTab extends HookConsumerWidget {
  const HomeAppTab({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onChanged,
  });

  final List<HomeAppTabItem> items;
  final ValueChanged<int>? onChanged;
  final int currentIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: items.length,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // indicatorColor: AppColors.primaryColor,
        // indicator: BoxDecoration(
        //   borderRadius: BorderRadius.circular(50),
        //   color: AppColors.primaryColor,
        // ),
        // onTap: onChanged,
        children: items
            .asMap()
            .entries
            .map(
              (e) => GestureDetector(
                onTap: () {
                  onChanged?.call(e.key);
                },
                child: HomeAppTabTile(
                  isActive: e.key == currentIndex,
                  icon: e.value.icon,
                  text: e.value.text,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
