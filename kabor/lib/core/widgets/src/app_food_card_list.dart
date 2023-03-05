import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class AppFoodCardList extends StatelessWidget {
  const AppFoodCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const AppFoodCard();
        },
        separatorBuilder: (context, index) => const Gap(20),
        itemCount: 10,
      ),
    );
  }
}
