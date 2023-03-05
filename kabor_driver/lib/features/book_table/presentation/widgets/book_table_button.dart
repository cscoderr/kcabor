import 'package:flutter/material.dart';
import 'package:kabor_driver/core/core.dart';

class BookTableButton extends StatelessWidget {
  const BookTableButton({
    super.key,
    required this.text,
    this.selected = false,
    this.onTap,
  });

  final String text;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppColors.primaryColor : AppColors.primaryColor2,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: context.$style.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
