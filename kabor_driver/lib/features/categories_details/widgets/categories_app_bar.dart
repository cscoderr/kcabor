import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/features/categories_details/widgets/categories_appbar_items.dart';

class CategoriesAppTab extends HookConsumerWidget {
  const CategoriesAppTab({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onChanged,
  });

  final List<CategoriesAppTabItem> items;
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
                child: CategoriesAppTabTile(
                  isActive: e.key == currentIndex,
                  text: e.value.text,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SubCategoriesAppTab extends HookConsumerWidget {
  const SubCategoriesAppTab({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onChanged,
  });

  final List<CategoriesAppTabItem> items;
  final ValueChanged<int>? onChanged;
  final int currentIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: items.length,
      child: ListView.separated(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => const Gap(10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onChanged?.call(index);
            },
            child: CategoriesAppTabTile(
              isActive: index == currentIndex,
              text: items[index].text,
            ),
          );
        },
      ),
    );
  }
}
