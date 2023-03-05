import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/order/order.dart';

class OrderMethodCard extends HookConsumerWidget {
  const OrderMethodCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final method = useState('Select a order method');
    return InkWell(
      onTap: () => context.showOrderMethodDialog(
        onSelected: (value) => method.value = value,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                method.value,
                style: context.$style.titleSmall!.copyWith(
                  color: AppColors.dark,
                ),
              ),
            ),
            const Icon(
              Iconsax.arrow_right_3,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
