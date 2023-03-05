import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';

class EarningListCard extends StatelessWidget {
  const EarningListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffF2F2F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: context.$style.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Bank',
                    style: context.$style.titleMedium!.copyWith(
                      color: const Color(0xff3DA925),
                    ),
                  )
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount',
                    style: context.$style.bodyLarge,
                  ),
                  Text(
                    'N23,000',
                    style: context.$style.bodyLarge,
                  )
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date   ',
                    style: context.$style.bodyLarge,
                  ),
                  Text(
                    '13, Jun, 2022',
                    style: context.$style.bodyLarge,
                  )
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: 10,
    );
  }
}
