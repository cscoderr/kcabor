import 'package:flutter/material.dart';
import 'package:kabor_driver/core/configs/app_extensions.dart';

class MyCustombutton extends StatelessWidget {
  const MyCustombutton({
    super.key,
    this.onTap,
    this.text,
  });

  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xff3DA925),
          borderRadius: BorderRadius.circular(34),
        ),
        child: Center(
          child: Text(
            text!,
            style: context.$style.titleLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
