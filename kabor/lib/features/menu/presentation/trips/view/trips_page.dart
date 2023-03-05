import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/menu.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'My Trips',
        trailing: AppExportButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const AppSearchField(
              hasSuffix: false,
            ),
            const Gap(20),
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) => Column(
                  children: const [
                    Gap(10),
                    Divider(),
                    Gap(10),
                  ],
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const TripCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
