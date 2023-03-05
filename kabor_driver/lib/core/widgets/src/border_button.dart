import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    this.text,
    this.onPressed,
    this.borderColor = AppColors.primaryColor,
    this.textColor = AppColors.primaryColor,
    this.textSize = 14.0,
    this.elevation = 0.0,
    this.radius = 34,
    this.opacity = 1.0,
    this.absorb = false,
    this.borderWidth = 1.0,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(20),
  });

  final String? text;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final double textSize;
  final double elevation;
  final double radius;
  final EdgeInsets padding;
  final double opacity;
  final bool absorb;
  final bool isLoading;
  final double borderWidth;

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
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
            child: isLoading
                ? const CircularProgressIndicator.adaptive()
                : Padding(
                    padding: padding,
                    child: Text(
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
