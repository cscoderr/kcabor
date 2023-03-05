import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/menu/settings/presentation/widgets/settings_container.dart';
import 'package:kabor_driver/features/menu/settings/presentation/widgets/settings_tile.dart';

class MenusPage extends StatelessWidget {
  const MenusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Menu',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SettingsContainer(
          children: [
            SettingsSubmenuTile(
              text: 'Food',
              hasSwitch: true,
            ),
            SettingsSubmenuTile(
              text: 'Take a ride',
              hasSwitch: true,
              isChecked: true,
            ),
            SettingsSubmenuTile(
              text: 'Book an Artisan',
              hasSwitch: true,
            ),
          ],
        ),
      ),
    );
  }
}
