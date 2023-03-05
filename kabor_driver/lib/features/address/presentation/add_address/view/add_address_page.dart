import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/app/data/data.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/address/address.dart';

class AddAddressPage extends HookConsumerWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const AppCloseButton(
                    color: AppColors.primaryColor2,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Location',
                        style: context.$style.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
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
                  ref.read(kaborRepositoryProvider).searchGoogleAddress(value);
                },
              ),
              const Gap(20),
              const AddressList(),
            ],
          ),
        ),
      ),
    );
  }
}
