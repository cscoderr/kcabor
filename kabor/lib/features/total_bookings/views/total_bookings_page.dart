import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/total_bookings/widgets/total_bookings_list.dart';

class TotalBookings extends StatefulWidget {
  const TotalBookings({super.key});

  @override
  State<TotalBookings> createState() => _TotalBookingsState();
}

class _TotalBookingsState extends State<TotalBookings> {
  @override
  Widget build(BuildContext context) {
    final isChecked = List<bool>.filled(5, false);
    return Scaffold(
      appBar: const KaborAppBar(title: 'Bookings'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: const [
              AppSearchField(
                hasSuffix: false,
              ),
              Gap(20),
              Expanded(
                child: TotalBookingsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
