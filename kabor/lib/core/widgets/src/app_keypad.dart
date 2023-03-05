import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AppKeypad extends StatefulWidget {
  const AppKeypad({
    super.key,
    this.onTap,
  });

  final ValueChanged<String>? onTap;

  @override
  State<AppKeypad> createState() => _AppKeypadState();
}

class _AppKeypadState extends State<AppKeypad> {
  final specialKeys = {9: '00', 10: '0', 11: '-1'};
  late TextEditingController valueController;
  @override
  void initState() {
    super.initState();

    valueController = TextEditingController();

    valueController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    valueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.75,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 50,
          mainAxisSpacing: 20,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          var key = '';
          var isSpaceKey = false;
          if (index <= 8) {
            key = (index + 1).toString();
          } else {
            final special = specialKeys[index];
            if (special == '-1') {
              isSpaceKey = true;
              key = '-1';
            } else {
              key = special!;
            }
          }
          return GestureDetector(
            onTap: () {
              if (key == '-1') {
                if (valueController.text.isEmpty ||
                    valueController.text.length == 1) {
                  valueController.text = '0';
                  widget.onTap?.call(valueController.text);
                  return;
                }
                valueController.text = valueController.text
                    .substring(0, valueController.text.length - 1);
                widget.onTap?.call(valueController.text);
              } else {
                // if (valueController.text == '0') {
                //   valueController.clear();
                // }
                valueController.text += key;
                widget.onTap?.call(valueController.text);
              }
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: AppColors.backgroundLightColor3,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: isSpaceKey
                  ? const Icon(Iconsax.arrow_left_2)
                  : Text(
                      key,
                      style: context.$style.titleMedium?.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
