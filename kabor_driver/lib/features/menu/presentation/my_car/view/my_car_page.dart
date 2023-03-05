import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor_driver/core/core.dart';

class MyCarPage extends StatelessWidget {
  const MyCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KaborAppBar(
        title: 'My Car',
        trailing: AppAddButton(),
        leading: AppCloseButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: const [
            MyCarCard(),
            Gap(20),
            MyCarCard(),
          ],
        ),
      ),
    );
  }
}

class MyCarCard extends StatelessWidget {
  const MyCarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor4,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Gap(10),
          Row(
            children: [
              Image.asset(AppImages.car2),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2015',
                    style: context.$style.titleMedium?.copyWith(),
                  ),
                  Text(
                    'Toyota Camry',
                    style: context.$style.titleMedium?.copyWith(),
                  ),
                  Chip(
                    backgroundColor: AppColors.primaryColor,
                    label: Text(
                      'In Use',
                      style: context.$style.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          InkWell(
            onTap: () => context.pushNamed(AppRoutes.myCarDetails),
            child: Text(
              'See Details',
              style: context.$style.titleMedium?.copyWith(
                color: AppColors.dark2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
