import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';

class FoodCategoryTabItem {
  const FoodCategoryTabItem({
    required this.text,
  });

  final String text;
}

class FoodCategoryTab extends HookConsumerWidget {
  const FoodCategoryTab({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onChanged,
  });

  final List<FoodCategoryTabItem> items;
  final ValueChanged<int>? onChanged;
  final int currentIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: items.length,
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Tab(
              child: GestureDetector(
                onTap: () {
                  onChanged?.call(index);
                },
                child: _FoodCategoryTabTile(
                  key: key,
                  isActive: index == currentIndex,
                  text: items[index].text,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Gap(20),
        ),
      ),
    );
  }
}

class _FoodCategoryTabTile extends StatelessWidget {
  const _FoodCategoryTabTile({
    super.key,
    required this.text,
    this.isActive = false,
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
