import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

import '../../../menu.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Support',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: const [
            SettingsContainer(
              children: [
                SettingsTile(
                  text: 'Getting started and FAQs',
                  icon: Iconsax.info_circle,
                ),
                SettingsTile(
                  text: 'Help ',
                  icon: Iconsax.support,
                ),
                SettingsTile(
                  text: 'Live Chat',
                  icon: Iconsax.sms,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
