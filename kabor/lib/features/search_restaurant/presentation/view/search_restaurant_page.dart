import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/home.dart';

class SearchRestaurantPage extends HookConsumerWidget {
  const SearchRestaurantPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Icon(Iconsax.search_normal_1),
                      hintText: 'Search',
                    ),
                  ),
                  Gap(20),
                  AppCloseButton(
                    color: AppColors.primaryColor2,
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      text: categories[index].text,
                      direction: Axis.horizontal,
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(20),
                  itemCount: categories.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
