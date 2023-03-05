import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';
import 'package:kabor_driver/core/widgets/src/app_food_card_list.dart';
import 'package:kabor_driver/features/home/presentation/widgets/restaurant_category_list.dart';

class FoodTab extends StatelessWidget {
  const FoodTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
            child: RestaurantCategoryList(),
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
