import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_infinite_scroll/smooth_infinite_scroll.dart';

class AppFoodCardList extends HookConsumerWidget {
  const AppFoodCardList({
    super.key,
    this.onLoadMore,
    required this.response,
    this.hasError = false,
    this.hasReachedMax = false,
  });

  final VoidCallback? onLoadMore;
  final bool hasError;
  final bool hasReachedMax;
  final PaginatedResponse<List<ProductResponse>>? response;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 280,
      child: SmoothInfiniteScroll<ProductResponse>(
        items: response?.data ?? [],
        scrollDirection: Axis.horizontal,
        hasError: hasError,
        hasMore: !hasReachedMax,
        loader: const AppFoodCardListShimmer(),
        seperator: const SizedBox(width: 20),
        onLoadMore: onLoadMore,
        itemBuilder: (context, index) {
          final item = response!.data![index];
          return AppFoodCard(
            name: '${item.name}',
            image: '${item.image}',
            restaurantName: '${item.restaurantName}',
            rating: '${item.avgRating}',
            onTap: () => context.pushNamed(AppRoutes.restaurantDetails),
          );
        },
      ),
    );
  }
}

class AppFoodCardListShimmer extends StatelessWidget {
  const AppFoodCardListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const AppFoodCardShimmer();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}

class AppFoodCardShimmer extends StatelessWidget {
  const AppFoodCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
