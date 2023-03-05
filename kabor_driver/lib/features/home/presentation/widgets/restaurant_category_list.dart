import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/home/presentation/providers/providers.dart';

class RestaurantCategoryList extends HookConsumerWidget {
  const RestaurantCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryTile(
          image: categories[index].image,
          text: categories[index].text,
          onTap: () => context.pushNamed(
            AppRoutes.restaurant,
            params: {
              'category': categories[index].text,
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Gap(20);
      },
      itemCount: categories.length,
      shrinkWrap: true,
    );
  }
}
