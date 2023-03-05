import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Dashboard',
        trailing: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/images/user1.png'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'Today’s Activities ',
                style: context.$style.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(15),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -25),
                        child: Text(
                          'N',
                          textScaleFactor: 1,
                          style: context.$style.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, 1),
                        child: Text(
                          '50,000',
                          style: context.$style.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -25),
                        child: Text(
                          '.00',
                          textScaleFactor: 1,
                          style: context.$style.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10),
            Center(
              child: Text(
                'Earnings ',
                style: context.$style.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '5 ',
                      style: context.$style.bodyLarge!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                    Text(
                      'Rides ',
                      style: context.$style.titleMedium!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3hr 18min',
                      style: context.$style.bodyLarge!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                    Text(
                      'Time ',
                      style: context.$style.titleMedium!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(10),
            const Divider(),
            const Gap(20),
            Text(
              'Stats ',
              style: context.$style.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.star1,
                          color: AppColors.yellowColor,
                          size: 20,
                        ),
                        const Gap(5),
                        Text(
                          '4.9',
                          style: context.$style.bodyLarge!.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rating',
                      style: context.$style.titleMedium!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '9,900',
                      style: context.$style.bodyLarge!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                    Text(
                      'Lifetime rides ',
                      style: context.$style.titleMedium!.copyWith(
                        color: AppColors.dark2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(20),
            const Divider(),
            const Gap(20),
            Text(
              'Get Paid More ',
              style: context.$style.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            Text(
              'Invite and track your driver referrals easily to earn extra cash ',
              textAlign: TextAlign.center,
              style: context.$style.titleMedium!.copyWith(),
            ),
            const Gap(20),
            SolidButton(
              text: 'Refer Friends',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
