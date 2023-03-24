import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';

class FoodCategoryPage extends ConsumerWidget {
  const FoodCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(getCategoryVMProvider);
    return Scaffold(
      body: categories.when(
        data: (data) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = data[index];
              return CategoryTile(
                image: category.image!,
                text: category.name!,
                onTap: () => context.pushNamed(
                  AppRoutes.restaurant,
                  queryParams: {
                    'title': category.name,
                    'categoryId': category.id.toString(),
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(20);
            },
            itemCount: data.length,
            shrinkWrap: true,
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
