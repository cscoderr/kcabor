import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/settings/presentation/widgets/settings_container.dart';
import 'package:kabor/features/menu/settings/presentation/widgets/settings_tile.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Legal',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            SettingsContainer(
              children: [
                SettingsTile(
                  text: 'Terms',
                  icon: Iconsax.sms,
                  hasLeadingIcon: false,
                  onTap: () => context.pushNamed(AppRoutes.terms),
                ),
                SettingsTile(
                  text: 'Privacy Policy',
                  icon: Iconsax.call,
                  hasLeadingIcon: false,
                  onTap: () => context.pushNamed(AppRoutes.policy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
