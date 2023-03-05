import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
    this.text,
    this.onPressed,
    this.color = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.textSize = 14.0,
    this.elevation = 0.0,
    this.radius = 34,
    this.opacity = 1.0,
    this.absorb = false,
    this.isLoading = false,
    this.child,
    this.padding = const EdgeInsets.all(15),
    this.border = const BorderSide(color: AppColors.primaryColor),
  });

  final String? text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final BorderSide border;
  final double radius;
  final EdgeInsets padding;
  final double opacity;
  final bool absorb;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onPressed == null,
      child: Opacity(
        opacity: onPressed == null ? 0.5 : 1.0,
        child: ConstrainedBox(
          constraints:
              BoxConstraints.tightFor(width: MediaQuery.of(context).size.width),
          child: ElevatedButton(
            onPressed: onPressed ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: border,
              ),
            ),
            child: isLoading
                ? const CircularProgressIndicator.adaptive()
                : Padding(
                    padding: padding,
                    child: child ??
                        Text(
                          text ?? '',
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: textColor,
                                fontSize: textSize,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
