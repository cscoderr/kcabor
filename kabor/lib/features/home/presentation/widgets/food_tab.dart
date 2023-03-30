import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';
import 'package:kabor/features/home/presentation/viewmodel/get_hot_deals_vm.dart';
import 'package:kabor/features/home/presentation/viewmodel/get_popular_food_viewmodel.dart';

class FoodTab extends HookConsumerWidget {
  const FoodTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getPopularFood = ref.watch(getPopularFoodVMProvider);
    final getHotDeals = ref.watch(getHotDealsVMProvider);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(getPopularFoodVMProvider.notifier).getPopularFood();
          ref.read(getHotDealsVMProvider.notifier).getHotDeals();
        });
        return null;
      },
      [],
    );

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
          getHotDeals.when(
            data: (data) {
              return AppFoodCardList(
                response: data,
                hasError: ref.watch(getHotDealsVMProvider.notifier).hasError,
                hasReachedMax: ref
                    .watch(
                      getHotDealsVMProvider.notifier,
                    )
                    .hasReachedMax,
                onLoadMore: () =>
                    ref.read(getHotDealsVMProvider.notifier).getHotDeals(
                          hasLoader: false,
                          offset: data.offset,
                          totalSize: data.totalSize,
                        ),
              );
            },
            error: (error, stack) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: KcaborProgressIndicator(),
            ),
          ),
          const Gap(10),
          Text(
            'Popular Near You',
            style: context.$style.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Gap(10),
          getPopularFood.when(
            data: (data) {
              return AppFoodCardList(
                response: data,
                hasError: ref.watch(getPopularFoodVMProvider.notifier).hasError,
                hasReachedMax: ref
                    .watch(
                      getPopularFoodVMProvider.notifier,
                    )
                    .hasReachedMax,
                onLoadMore: () =>
                    ref.read(getPopularFoodVMProvider.notifier).getPopularFood(
                          hasLoader: false,
                          offset: data.offset,
                          totalSize: data.totalSize,
                        ),
              );
            },
            error: (error, stack) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: KcaborProgressIndicator(),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
