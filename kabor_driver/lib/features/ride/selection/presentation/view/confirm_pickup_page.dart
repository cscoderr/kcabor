import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/address/address.dart';
import 'package:kabor_driver/features/ride/ride.dart';

class ConfirmPickupPage extends HookConsumerWidget {
  const ConfirmPickupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAddress = useState(false);
    return MapScafffold(
      children: [
        const MapBackButton(),
        if (!showAddress.value)
          _buildChooseSpotBottomSheet(context, showAddress)
        else
          _buildAddressBottomSheet(context, showAddress),
      ],
    );
  }

  Widget _buildChooseSpotBottomSheet(
    BuildContext context,
    ValueNotifier<bool> showAddress,
  ) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a spot',
              style: context.$style.titleMedium?.copyWith(),
            ),
            const Divider(),
            const Gap(20),
            InkWell(
              onTap: () {
                showAddress.value = !showAddress.value;
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '20, Oko Erin',
                      style: context.$style.titleMedium?.copyWith(),
                    ),
                  ),
                  const Icon(Iconsax.search_normal),
                ],
              ),
            ),
            const Gap(20),
            SolidButton(
              text: 'Confirm pickup',
              onPressed: () => context.pushNamed(AppRoutes.connectRider),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressBottomSheet(
    BuildContext context,
    ValueNotifier<bool> showAddress,
  ) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const AppSearchField(
              hasSuffix: false,
            ),
            const Gap(20),
            Flexible(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (BuildContext context, int index) => Column(
                  children: const [
                    Gap(10),
                    Divider(),
                  ],
                ),
                itemBuilder: (BuildContext context, int index) {
                  return AddressTile(
                    title: 'Shoprite Kwara Mall',
                    subtitle: 'Fate Road, Ilorin, Nigeria ',
                    onTap: () {
                      showAddress.value = !showAddress.value;
                    },
                  );
                },
              ),
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            const AddressTile(
              title: 'My Location',
              subtitle: '',
              hasTrailing: false,
            ),
            const Gap(10),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
