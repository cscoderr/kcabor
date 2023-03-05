import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          indicatorWeight: 0,
          splashFactory: NoSplash.splashFactory,
          indicator: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          tabs: const [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Credit',
            ),
            Tab(
              text: 'Debit',
            ),
          ],
        ),
      ),
    );
  }
}
