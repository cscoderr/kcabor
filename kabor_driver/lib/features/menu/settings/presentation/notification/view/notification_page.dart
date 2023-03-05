import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/menu/settings/presentation/widgets/settings_container.dart';
import 'package:kabor_driver/features/menu/settings/presentation/widgets/settings_tile.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Notification',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SettingsContainer(
          children: [
            SettingsSubmenuTile(
              text: 'Email notification',
              hasSwitch: true,
            ),
            SettingsSubmenuTile(
              text: 'Push notification',
              hasSwitch: true,
              isChecked: true,
            ),
          ],
        ),
      ),
    );
  }
}
