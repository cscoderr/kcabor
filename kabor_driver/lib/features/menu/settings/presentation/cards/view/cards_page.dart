import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/menu/settings/presentation/widgets/settings_container.dart';
import 'package:kabor_driver/features/menu/settings/presentation/widgets/settings_tile.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Cards And Bank',
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
                  text: 'Debit Cards',
                  icon: Iconsax.sms,
                  hasLeadingIcon: false,
                  onTap: () => context.pushNamed(AppRoutes.terms),
                ),
                SettingsTile(
                  text: 'Withdrawal Bank Settings ',
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
