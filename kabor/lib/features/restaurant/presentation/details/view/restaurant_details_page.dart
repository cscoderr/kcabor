import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/restaurant/restaurant.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.showBookATableDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    right: 15,
                    top: 10,
                    child: Row(
                      children: const [
                        AppBackButton(),
                        Spacer(),
                        AppInfoButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poached - GRA, Ilorin',
                      style: context.$style.headline5?.copyWith(
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
                          '4.5 (2.5k).Breakfast',
                          style: context.$style.titleSmall!.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Text(
                      '30-45mins',
                      style: context.$style.titleSmall!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Our Menu',
                      style: context.$style.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const FoodCategoryTab(
                      items: [
                        FoodCategoryTabItem(
                          text: 'Eggs',
                        ),
                        FoodCategoryTabItem(
                          text: 'Baked',
                        ),
                        FoodCategoryTabItem(
                          text: 'Fried',
                        ),
                        FoodCategoryTabItem(
                          text: 'Fruits',
                        ),
                        FoodCategoryTabItem(
                          text: 'Fruits',
                        ),
                      ],
                      currentIndex: 0,
                    ),
                    const Gap(20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Gap(20),
                        itemBuilder: (BuildContext context, int index) {
                          return FoodCard(
                            onTap: () => context.pushNamed(AppRoutes.food),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
