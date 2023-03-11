import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/widgets/src/app_food_card_list.dart';
import 'package:kabor/features/food_category/food_category.dart';

class FoodTab extends ConsumerWidget {
  const FoodTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
            child: FoodCategoryPage(),
          ),
          const Gap(10),
          Text(
            'Hot Deals',
            style: context.$style.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Gap(20),
          const AppFoodCardList(),
          const Gap(10),
          Text(
            'Popular Near You',
            style: context.$style.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Gap(10),
          const AppFoodCardList(),
        ],
      ),
    );
  }
}
