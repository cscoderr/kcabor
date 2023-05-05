import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/home.dart';
import 'package:kabor/features/restaurant/presentation/viewmodel/get_food_by_category_viewmodel.dart';
import 'package:kabor/features/restaurant/restaurant.dart';
import 'package:smooth_infinite_scroll/smooth_infinite_scroll.dart';

class RestaurantPage extends HookConsumerWidget {
  const RestaurantPage({
    super.key,
    required this.title,
    required this.categoryId,
  });

  final String title;
  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getFoodCategory = ref.watch(getFoodCategoryVMProvider);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(getFoodCategoryVMProvider.notifier).getFoodByCategory(
                int.parse(categoryId),
              );
        });
        return null;
      },
      [],
    );

    return KcaborLoader(
      isLoading: false,
      child: Scaffold(
        appBar: KaborAppBar(
          title: title,
          trailing: AppFilterButton(
            onTap: () => context.showFilterDialog(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SearchTextField(),
              const Gap(20),
              Expanded(
                child: getFoodCategory.when(
                  data: (data) {
                    final response = data.data;
                    return SmoothInfiniteScroll<ProductResponse>(
                      items: response ?? [],
                      hasError: ref
                          .watch(getFoodCategoryVMProvider.notifier)
                          .hasError,
                      hasMore: !ref
                          .watch(getFoodCategoryVMProvider.notifier)
                          .hasReachedMax,
                      loader: const KcaborProgressIndicator(),
                      onLoadMore: () => ref
                          .read(getFoodCategoryVMProvider.notifier)
                          .getFoodByCategory(
                            int.parse(categoryId),
                            hasLoader: false,
                            offset: data.offset.toString(),
                            totalSize: data.totalSize,
                          ),
                      itemBuilder: (context, index) {
                        final item = response![index];
                        return AppFoodCard(
                          name: '${item.name}',
                          image: '${item.image}',
                          restaurantName: '${item.restaurantName}',
                          rating: '${item.avgRating}',
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
                    );
                  },
                  error: (error, stack) => Center(
                    child: Text(error.toString()),
                  ),
                  loading: () => const Center(
                    child: KcaborProgressIndicator(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
