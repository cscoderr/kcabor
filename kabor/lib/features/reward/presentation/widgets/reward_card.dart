import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/configs/app_extensions.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (conetxt, index) {
        return Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF2F2F5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '50% promo for 5 rides',
                        style: context.$style.titleMedium,
                      ),
                      const Gap(5),
                      Text(
                        'Maximum discount for N500',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/images/options.svg')
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not yet applied',
                    style: context.$style.bodyLarge!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '4 days left ',
                    style: context.$style.bodyLarge!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: 2,
    );
  }
}
