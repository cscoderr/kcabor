import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';
import 'package:timelines/timelines.dart';

class ScheduleEventCard extends StatelessWidget {
  const ScheduleEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showConfirmationDialog<int>(
          context: context,
          title: 'Cancel schedule ride?',
          message: 'You can always schedule again or request a ride now ',
          cancelLabel: "Don't Cancel",
          actions: [
            const AlertDialogAction(
              label: 'Cancel',
              textStyle: TextStyle(
                color: AppColors.red,
              ),
              key: 0,
            ),
          ],
        );
        // logger.info(result);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundLightColor4,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.car),
            const Gap(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kabor',
                    style: context.$style.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Tue,21 Sept, 12:19 -12:45 AM ',
                    style: context.$style.titleMedium?.copyWith(),
                  ),
                  const Gap(10),
                  _DeliveryProcesses(processes: _data),
                ],
              ),
            ),
            const AppCloseButton(
              color: AppColors.primaryColor2,
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({required this.processes});

  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: AppColors.primaryColor,
        indicatorTheme: const IndicatorThemeData(
          position: 0,
          size: 16,
        ),
        connectorTheme: const ConnectorThemeData(
          thickness: 3,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: processes.length,
        contentsBuilder: (_, index) {
          return Padding(
            padding: (index != (processes.length - 1))
                ? const EdgeInsets.only(left: 8, bottom: 40)
                : const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  processes[index].name,
                  style: context.$style.labelLarge?.copyWith(),
                ),
                Text(
                  processes[index].message!.address,
                  style: context.$style.bodySmall,
                ),
              ],
            ),
          );
        },
        indicatorBuilder: (_, index) {
          return const DotIndicator(
            color: AppColors.primaryColor,
          );
        },
        connectorBuilder: (_, index, ___) => const SolidLineConnector(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

List<_DeliveryProcess> get _data => const [
      _DeliveryProcess(
        'Shoprite Kwara Mall',
        message: _DeliveryMessage(
          '8:21am',
          'Pick-up',
          'Fate Road, Ilorin, Nigeria',
        ),
      ),
      _DeliveryProcess(
        '23 Lower Basin',
        message: _DeliveryMessage(
          '8:45am',
          'Drop-off',
          'Basin Road, Ilorin, Nigeria',
        ),
      ),
    ];

class _DeliveryProcess {
  const _DeliveryProcess(
    this.name, {
    this.message,
  });

  final String name;
  final _DeliveryMessage? message;
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message, this.address);

  final String createdAt; // final DateTime createdAt;
  final String message;
  final String address;

  @override
  String toString() {
    return '$createdAt $message $address';
  }
}
