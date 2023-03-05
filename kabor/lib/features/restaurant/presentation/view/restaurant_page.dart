import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/home.dart';
import 'package:kabor/features/restaurant/restaurant.dart';

class RestaurantPage extends HookConsumerWidget {
  const RestaurantPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Text(
                    title,
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppFilterButton(
                    onTap: () => context.showFilterDialog(),
                  ),
                ],
              ),
              const Gap(20),
              const SearchTextField(),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AppFoodCard(
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.restaurantDetails,
                          params: {
                            'category': title,
                          },
                        );
                      },
                      width: double.infinity,
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(20),
                  itemCount: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
