import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/core.dart';

class MyCarDetailsPage extends StatelessWidget {
  const MyCarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Toyota Camry ',
        leading: AppCloseButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            Image.asset(AppImages.car1),
            const Gap(50),
            const MyCarDetailsTile(
              title: 'Model',
              content: '2015',
            ),
            const MyCarDetailsTile(
              title: 'Brand',
              content: 'Toyota Camry',
            ),
            const MyCarDetailsTile(
              title: 'State',
              content: 'Lagos',
            ),
            const MyCarDetailsTile(
              title: 'Color',
              content: 'White',
            ),
            const Spacer(),
            SolidButton(
              text: 'Delete',
              onPressed: () {},
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class MyCarDetailsTile extends StatelessWidget {
  const MyCarDetailsTile({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            content,
            style: context.$style.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
