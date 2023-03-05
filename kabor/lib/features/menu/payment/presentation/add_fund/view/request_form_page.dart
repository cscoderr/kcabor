import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class RequestFormPage extends StatelessWidget {
  const RequestFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Request Form'),
      body: Column(
        children: [
          Center(
            child: Text(
              'Phone contacts on Kabor ',
              style: context.$style.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
