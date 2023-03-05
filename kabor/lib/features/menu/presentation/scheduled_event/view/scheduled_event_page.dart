import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/menu.dart';

class ScheduledEventPage extends StatelessWidget {
  const ScheduledEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KaborAppBar(
        title: 'Schedule Events',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: const [
            ScheduleEventCard(),
            Gap(20),
            FoodEventCard(),
          ],
        ),
      ),
    );
  }
}
