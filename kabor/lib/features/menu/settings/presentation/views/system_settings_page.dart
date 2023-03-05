import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';

import '../presentation.dart';

class SystemSettingsPage extends HookConsumerWidget {
  const SystemSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = useState(true);
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'System Settings',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SettingsContainer(
          children: [
            SettingsSubmenuTile(
              text: 'Use device settings',
              hasCheckbox: true,
              onChanged: (value) {},
            ),
            SettingsSubmenuTile(
              text: 'Light Mode',
              isChecked: darkMode.value,
              hasCheckbox: true,
              onChanged: (value) {
                darkMode.value = value ?? false;
              },
            ),
            SettingsSubmenuTile(
              text: 'Dark Mode',
              hasCheckbox: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
