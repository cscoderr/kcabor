import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class FoodCategoryListShimmer extends StatelessWidget {
  const FoodCategoryListShimmer({super.key});

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
            return const FoodCategoryCardShimmer();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}

class FoodCategoryCardShimmer extends StatelessWidget {
  const FoodCategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xFFFFCD99),
        ),
        const Gap(10),
        Container(
          height: 10,
          width: 50,
          color: Colors.grey,
        )
      ],
    );
  }
}
