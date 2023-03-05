import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Poached Eggs',
                style: context.$style.titleSmall?.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Poached, garnished with parlsey',
                style: context.$style.labelMedium?.copyWith(
                  color: AppColors.dark2,
                ),
              )
            ],
          ),
          const Spacer(),
          const Text('NGN 3500')
        ],
      ),
    );
  }
}
