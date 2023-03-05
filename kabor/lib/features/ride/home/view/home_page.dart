import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/address/address.dart';

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
          RichText(
            text: const TextSpan(
              text: "Let's Go for a Ride ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Tommy',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          AddressTile(
            title: 'Shoprite Kwara Mall',
            subtitle: 'Fate Road, Ilorin, Nigeria ',
            hasTrailing: false,
            onTap: () {},
          ),
          const Gap(10),
          const Divider(),
          AddressTile(
            title: 'Ilorin International Airport ',
            subtitle: 'Airport Road, Ilorin, Nigeria ',
            hasTrailing: false,
            onTap: () {},
          ),
          const Gap(10),
          const Divider(),
          AddressTile(
            title: 'Al-Hikmah University',
            subtitle: 'Ilorin, Nigeria, Al- Hikamah Univerisity',
            hasTrailing: false,
            onTap: () {},
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
