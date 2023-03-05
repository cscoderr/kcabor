import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Start Earning, ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'John',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Scan for nearby requests ',
                      style: context.$style.titleSmall!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
              ),
              const AppSearchButton(),
            ],
          ),
          const Gap(5),
          const Divider(),
          const Gap(10),
          Text(
            'Queue',
            style: context.$style.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
          const Gap(10),
          Row(
            children: const [
              QueueCard(isActive: true),
              Gap(10),
              QueueCard(),
              Gap(10),
              QueueCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class QueueCard extends StatelessWidget {
  const QueueCard({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: 1 == 2
              ? AssetImage(AppImages.user1)
              : AssetImage(AppImages.food2),
        ),
        if (isActive)
          const Positioned(
            right: 0,
            top: 8,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.primaryColor,
            ),
          )
      ],
    );
  }
}
