import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/core/widgets/src/app_back_button.dart';
import 'package:kabor_driver/features/earning_list/widgets/earning_listsss.dart';

class EarningList extends StatelessWidget {
  const EarningList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Earning List'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: const [
              Expanded(
                child: EarningListCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
