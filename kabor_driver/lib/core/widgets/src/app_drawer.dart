import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(30),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(AppImages.chat),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tommy Tommy',
                        style: context.$style.titleMedium?.copyWith(
                          color: AppColors.dark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () => context.pushNamed(AppRoutes.profile),
                        child: Text(
                          'Edit Profile',
                          style: context.$style.labelLarge?.copyWith(
                            color: AppColors.dark2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(30),
              _AppDrawerTile(
                icon: Iconsax.speedometer,
                text: 'My Dashboard',
                onTap: () => context.pushNamed(AppRoutePaths.dashboard),
              ),
              _AppDrawerTile(
                customIcon: AppIcons.refer,
                text: 'Refer a Friend',
                onTap: () => context.pushNamed(AppRoutes.refer),
              ),
              if (1 == 2)
                _AppDrawerTile(
                  icon: Iconsax.money_4,
                  text: 'Navigation',
                  onTap: () => context.pushNamed(AppRoutes.earnings),
                ),
              _AppDrawerTile(
                icon: Iconsax.car,
                text: 'My Car',
                onTap: () => context.pushNamed(AppRoutes.myCar),
              ),
              _AppDrawerTile(
                icon: Iconsax.card,
                text: 'Payment',
                onTap: () => context.pushNamed(AppRoutes.payment),
              ),
              _AppDrawerTile(
                icon: Iconsax.driving,
                text: 'My Trip',
                onTap: () => context.pushNamed(AppRoutes.trip),
              ),
              _AppDrawerTile(
                icon: Iconsax.message,
                text: 'Chats',
                onTap: () => context.pushNamed(AppRoutes.chats),
              ),
              _AppDrawerTile(
                icon: Iconsax.setting_2,
                text: 'Settings',
                onTap: () => context.pushNamed(AppRoutes.settings),
              ),
              _AppDrawerTile(
                icon: Iconsax.support,
                text: 'Support',
                onTap: () => context.pushNamed(AppRoutes.support),
              ),
              const Spacer(),
              Row(
                children: [
                  const Expanded(
                    child: Text('Switch to Delivery'),
                  ),
                  FlutterSwitch(
                    width: 45,
                    height: 24,
                    valueFontSize: 25,
                    toggleSize: 15,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: Colors.white,
                    inactiveToggleColor: AppColors.primaryColor,
                    value: false,
                    switchBorder: Border.all(color: AppColors.primaryColor),
                    onToggle: (value) {},
                  ),
                ],
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppDrawerTile extends StatelessWidget {
  const _AppDrawerTile({
    required this.text,
    this.icon,
    this.customIcon,
    this.onTap,
  });

  final IconData? icon;
  final String text;
  final String? customIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            if (customIcon != null)
              SvgPicture.asset(customIcon!)
            else
              Icon(icon),
            const Gap(15),
            Text(
              text,
              style: context.$style.labelLarge?.copyWith(
                color: AppColors.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
