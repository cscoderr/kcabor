import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 74,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[100],
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/mama.png'),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Payment Request ',
                        style: context.$style.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(100),
                      Text(
                        '2mins ago',
                        style: context.$style.bodySmall,
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'Patricia has requested for payment',
                    style: context.$style.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: 4,
      separatorBuilder: (context, index) => const Gap(10),
    );
  }
}
