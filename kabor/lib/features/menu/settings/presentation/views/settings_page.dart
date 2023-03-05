import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/settings/presentation/presentation.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KaborAppBar(
        title: 'Settings',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SettingsContainer(
              children: [
                SettingsTile(
                  text: 'Password',
                  icon: Iconsax.sms,
                  onTap: () => context.pushNamed(AppRoutes.changePassword),
                ),
                SettingsTile(
                  text: 'talk2borlah@gmail.com',
                  icon: Iconsax.sms,
                  onTap: () => context.pushNamed(AppRoutes.addEmail),
                ),
                SettingsTile(
                  text: '+234 818 498 9768',
                  icon: Iconsax.call,
                  onTap: () => context.pushNamed(AppRoutes.phoneNumber),
                ),
                SettingsTile(
                  text: 'Dark Mode',
                  icon: Iconsax.moon,
                  hasTrailingText: true,
                  trailingText: 'Use device settings',
                  onTap: () => context.pushNamed(AppRoutes.systemSettings),
                ),
                SettingsTile(
                  text: 'Default Menu ',
                  icon: Iconsax.screenmirroring,
                  hasTrailingText: true,
                  trailingText: 'Food',
                  onTap: () => context.pushNamed(AppRoutes.defaultMenu),
                ),
              ],
            ),
            const Gap(20),
            SettingsContainer(
              children: [
                SettingsTile(
                  text: 'Home',
                  icon: Iconsax.buildings,
                  trailingText: '20, Oko Erin, Ilorin',
                  hasTrailingText: true,
                  onTap: () => context.pushNamed(AppRoutes.homeAddress),
                ),
                SettingsTile(
                  text: 'Add Work',
                  icon: Iconsax.briefcase,
                  trailingText: 'Set once and go',
                  hasTrailingText: true,
                  onTap: () => context.pushNamed(AppRoutes.workEmail),
                ),
                SettingsTile(
                  text: 'Card & Bank',
                  icon: Iconsax.card,
                  onTap: () => context.pushNamed(AppRoutes.cardAndBank),
                ),
                SettingsTile(
                  text: 'Menu',
                  icon: Iconsax.task,
                  onTap: () => context.pushNamed(AppRoutes.menus),
                ),
                SettingsTile(
                  text: 'Notification',
                  icon: Iconsax.notification,
                  onTap: () => context.pushNamed(AppRoutes.notifications),
                ),
                SettingsTile(
                  text: 'Drive with Kaboor',
                  icon: Iconsax.car,
                  onTap: () => context.pushNamed(AppRoutes.driveWithKaboor),
                ),
                SettingsTile(
                  text: 'Legal ',
                  icon: Iconsax.shield_cross,
                  onTap: () => context.pushNamed(AppRoutes.legal),
                ),
              ],
            ),
            const Gap(20),
            SettingsContainer(
              children: [
                SettingsTile(
                  text: 'Log out',
                  isLogout: true,
                  icon: Iconsax.logout,
                  onTap: () => context.pushNamed(AppRoutes.legal),
                ),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
