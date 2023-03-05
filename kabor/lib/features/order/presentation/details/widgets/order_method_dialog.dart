import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as bottom_sheet;

class OrderMethodOptionPage extends StatelessWidget {
  const OrderMethodOptionPage({
    super.key,
    this.onSelected,
  });

  final ValueChanged<String>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          bottom: false,
          // top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Order Method',
                  style: context.$style.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Gap(5),
                ListTile(
                  title: Text(
                    'Pick Up',
                    style: context.$style.labelLarge,
                  ),
                  onTap: () {
                    onSelected?.call('Pick Up');
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    'Delivery',
                    style: context.$style.labelLarge,
                  ),
                  trailing: const Icon(
                    Iconsax.tick_circle5,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  onTap: () {
                    onSelected?.call('Delivery');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderMethodDialogPage extends StatelessWidget {
  const OrderMethodDialogPage({
    super.key,
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          bottom: false,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, (1 - animation.value) * 100),
              child: Opacity(
                opacity: max(0, animation.value * 2 - 1),
                child: child,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Flexible(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

extension OrderMethodDialogEx on BuildContext {
  Future<T?> showOrderMethodOptionDialog<T>({
    required WidgetBuilder builder,
    bool useRootNavigator = false,
  }) async {
    final result =
        await Navigator.of(this, rootNavigator: useRootNavigator).push(
      bottom_sheet.ModalBottomSheetRoute<T>(
        builder: builder,
        containerBuilder: (_, animation, child) => OrderMethodDialogPage(
          animation: animation,
          child: child,
        ),
        expanded: false,
        bounce: true,
        barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
        // ignore: avoid_redundant_argument_values
        isDismissible: kDebugMode,
        enableDrag: false,
      ),
    );
    return result;
  }

  Future<void> showOrderMethodDialog({
    ValueChanged<String>? onSelected,
  }) async {
    await showOrderMethodOptionDialog<void>(
      builder: (context) => OrderMethodOptionPage(
        onSelected: onSelected,
      ),
    );
  }
}
