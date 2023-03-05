import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/address/address.dart';

class PickupPage extends ConsumerWidget {
  const PickupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Where are you going',
        leading: AppCloseButton(
          color: AppColors.primaryColor2,
        ),
        trailing: AppAddButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  AppTextField(
                    autocorrectEnabled: false,
                    prefix: SvgPicture.asset(
                      AppIcons.point,
                    ),
                    hintText: 'Address',
                  ),
                  AppTextField(
                    prefixIcon: const Icon(
                      Iconsax.house5,
                      color: AppColors.primaryColor,
                    ),
                    hintText: 'House No.',
                    autocorrectEnabled: false,
                    onChanged: (value) {
                      ref
                          .read(kaborRepositoryProvider)
                          .searchGoogleAddress(value);
                    },
                  ),
                  const Gap(20),
                  const AddressList(),
                ],
              ),
            ),
            SolidButton(
              text: 'Confirm Route',
              onPressed: () => context.pushNamed(AppRoutes.selection),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
