import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as bottom_sheet;

class AddressOptionPage extends StatelessWidget {
  const AddressOptionPage({super.key});

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
                ListTile(
                  title: const Text('Edit Address'),
                  leading: const Icon(Iconsax.edit_2),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {
                    Navigator.pop(context);
                    context.pushNamed(AppRoutes.addAddress);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Pick Live Location'),
                  leading: const Icon(Iconsax.location),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {
                    Navigator.pop(context);
                    context.pushNamed(AppRoutes.liveLocation);
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

class AddressDialogPage extends StatelessWidget {
  const AddressDialogPage({
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

extension AddressDialogEx on BuildContext {
  Future<T?> showAddressOptionDialog<T>({
    required WidgetBuilder builder,
    bool useRootNavigator = false,
  }) async {
    final result =
        await Navigator.of(this, rootNavigator: useRootNavigator).push(
      bottom_sheet.ModalBottomSheetRoute<T>(
        builder: builder,
        containerBuilder: (_, animation, child) => AddressDialogPage(
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

  Future<void> showAddressDialog() async {
    await showAddressOptionDialog<void>(
      builder: (context) => const AddressOptionPage(),
    );
  }
}
