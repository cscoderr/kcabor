import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/notifications/widgets/notification_list.dart';

class Notificaition extends StatelessWidget {
  const Notificaition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Mark all as read',
                    softWrap: true,
                    style: context.$style.titleMedium,
                  ),
                ),
              ],
            ),
            const Gap(10),
            const Expanded(
              child: NotificationCard(),
            )
          ],
        ),
      ),
    );
  }
}
