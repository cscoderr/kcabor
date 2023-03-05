import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/presentation/widgets/artisan_categories.dart';
import 'package:kabor/features/home/presentation/widgets/nearby_lists.dart';
import 'package:kabor/features/home/presentation/widgets/services.dart';

class ArtisanTab extends StatelessWidget {
  const ArtisanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Categories',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.pushNamed(AppRoutePaths.categories),
                child: Text(
                  'See all',
                  style: context.$style.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff3DA925),
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          const Gap(10),
          const SizedBox(
            height: 90,
            child: ArtisanCategories(),
          ),
          const Gap(10),
          Text(
            'Nearby Services',
            style: context.$style.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          const SizedBox(
            height: 240,
            child: NearbyServices(),
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                'Services',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.pushNamed(AppRoutePaths.allServices),
                child: Text(
                  'View All',
                  style: context.$style.bodyLarge!.copyWith(
                    color: const Color(0xff3DA925),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          const SizedBox(
            height: 240,
            child: Services(),
          ),
        ],
      ),
    );
  }
}
