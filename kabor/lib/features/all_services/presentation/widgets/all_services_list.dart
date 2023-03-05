import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class AllServicesCard extends StatelessWidget {
  const AllServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.78,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return const ServiceCard();
      },
    );
  }
}
