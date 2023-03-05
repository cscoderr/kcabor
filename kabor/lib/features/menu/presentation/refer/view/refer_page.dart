import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const KaborAppBar(
        title: 'Refer a friend',
        textColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SvgPicture.asset(AppImages.refer),
            const Gap(20),
            Text(
              'Refer a friend and \n get rewards ',
              textAlign: TextAlign.center,
              style: context.$style.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            SolidButton(
              text: 'Invite a friend  ',
              color: Colors.white,
              textColor: AppColors.primaryColor,
              onPressed: () => context.pushNamed(AppRoutes.requestForm),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
