import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/food_category/food_category.dart';
import 'package:kabor/features/restaurant/presentation/details/providers/food_by_category_provider.dart';
import 'package:kabor/features/restaurant/presentation/details/providers/get_restuarant_details_provider.dart';
import 'package:kabor/features/restaurant/restaurant.dart';

class RestaurantDetailsPage extends StatefulHookConsumerWidget {
  const RestaurantDetailsPage({super.key, required this.productId});

  final String productId;

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends ConsumerState<RestaurantDetailsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.showBookATableDialog();
      ref.read(getProductDetailsProvider.notifier).getDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getProductDetailsProvider);
    final foodCategoryState = ref.watch(foodByCategoryProvider);
    final selectedMenu = useState(0);

    ref.listen<AsyncValue<RestaurantResponse>>(getProductDetailsProvider,
        (previous, state) {
      state.maybeWhen(
        orElse: () {},
        data: (data) {
          ref.read(foodByCategoryProvider.notifier).getFoodByCategory(
                categoryId: data.categoryIds?.first.toString() ?? '0',
              );
        },
      );
    });
    return Scaffold(
      body: state.when(
        data: (data) {
          final menus = ref
              .read(getCategoryVMProvider.notifier)
              .mapCategoryIdToCategory(data.categoryIds ?? []);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const AppBackButton(),
                expandedHeight: 300,
                toolbarHeight: 50,
                backgroundColor: AppColors.primaryColor,
                pinned: true,
                floating: true,
                actions: const [
                  AppInfoButton(),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://dev.kcabor.com/storage/app/public/restaurant/cover/${data.coverPhoto}',
                    // 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Gap(10),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://dev.kcabor.com/storage/app/public/restaurant/${data.logo}',
                            ),
                          ),
                          const Gap(15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name ?? '',
                                style: context.$style.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.star1,
                                    color: AppColors.yellowColor,
                                  ),
                                  const Gap(5),
                                  Text(
                                    '${data.avgRating} (${data.ratingCount})',
                                    style: context.$style.titleSmall!.copyWith(
                                      color: AppColors.dark2,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              Text(
                                '${data.deliveryTime} min',
                                style: context.$style.titleSmall!.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Our Menu',
                        style: context.$style.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      FoodCategoryTab(
                        onChanged: (value) {
                          selectedMenu.value = value;
                          ref
                              .read(foodByCategoryProvider.notifier)
                              .getFoodByCategory(
                                categoryId: menus[value].id.toString(),
                              );
                        },
                        items: menus
                            .map(
                              (e) => FoodCategoryTabItem(
                                text: e.name ?? '',
                              ),
                            )
                            .toList(),
                        currentIndex: selectedMenu.value,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              foodCategoryState.when(
                data: (foodCategory) {
                  final food = foodCategory.data ?? [];
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ).add(
                            const EdgeInsets.only(
                              bottom: 20,
                            ),
                          ),
                          child: FoodCard(
                            name: food[index].name ?? '',
                            onTap: () => context.pushNamed(AppRoutes.food),
                          ),
                        );
                      },
                      childCount: food.length,
                    ),
                  );
                },
                error: (error, _) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(error.toString()),
                    ),
                  );
                },
                loading: () {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: KcaborProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          );
        },
        error: (error, _) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: KcaborProgressIndicator(),
          );
        },
      ),
    );
  }
}
