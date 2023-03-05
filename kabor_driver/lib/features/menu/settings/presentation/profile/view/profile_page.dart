import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/menu/settings/settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KaborAppBar(
        title: 'Profile',
        trailing: AppEditButton(
          onTap: () => context.pushNamed(AppRoutes.editProfile),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AppImages.chat),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Awotundun Maimunah',
                        style: context.$style.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '+2348184989768',
                        style: context.$style.bodySmall?.copyWith(
                          color: AppColors.dark2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(20),
            const ProfileTile(
              icon: Iconsax.sms,
              text: 'talk2borlah@gmail.com',
            ),
            const Gap(10),
            const Divider(),
            const Gap(20),
            Text(
              'Favorite locations ',
              style: context.$style.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            const ProfileTile(
              icon: Iconsax.buildings,
              text: 'Oko Erin, Ilorin',
            ),
            const Gap(20),
            const ProfileTile(
              icon: Iconsax.briefcase,
              text: 'Shoprite Kwara Mall',
            ),
            const Gap(20),
            const Divider(),
            const ProfileTile(
              icon: Iconsax.user_minus,
              text: 'Delete Account',
              isDanger: true,
            ),
          ],
        ),
      ),
    );
  }
}
