import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/presentation/viewmodel/get_popular_food_viewmodel.dart';
import 'package:smooth_infinite_scroll/smooth_infinite_scroll.dart';

class AppFoodCardList extends HookConsumerWidget {
  const AppFoodCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getPopularFood = ref.watch(getPopularFoodVMProvider);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(getPopularFoodVMProvider.notifier).getPopularFood();
        });
        return null;
      },
      [],
    );
    return SizedBox(
      height: 280,
      child: getPopularFood.when(
        data: (data) {
          final response = data.data;
          return SmoothInfiniteScroll<ProductResponse>(
            items: response ?? [],
            scrollDirection: Axis.horizontal,
            hasError: ref.watch(getPopularFoodVMProvider.notifier).hasError,
            hasMore:
                !ref.watch(getPopularFoodVMProvider.notifier).hasReachedMax,
            loader: const KcaborProgressIndicator(),
            onLoadMore: () =>
                ref.read(getPopularFoodVMProvider.notifier).getPopularFood(
                      hasLoader: false,
                      offset: data.offset,
                      totalSize: data.totalSize,
                    ),
            itemBuilder: (context, index) {
              final item = response![index];
              return AppFoodCard(
                name: '${item.name}',
                image: '${item.image}',
                restaurantName: '${item.restaurantName}',
                rating: '${item.avgRating}',
                onTap: () {},
                width: double.infinity,
              );
            },
          );
        },
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: KcaborProgressIndicator(),
        ),
      ),
    );
  }
}
