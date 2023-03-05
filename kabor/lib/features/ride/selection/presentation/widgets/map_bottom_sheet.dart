import 'package:flutter/material.dart';

class MapBottomSheet extends StatelessWidget {
  const MapBottomSheet({
    super.key,
    required this.child,
    this.ondrag,
    this.heightDivisor = 5,
  });

  final Widget child;
  final double heightDivisor;
  final VoidCallback? ondrag;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: GestureDetector(
        onVerticalDragDown: (details) {
          ondrag?.call();
        },
        child: AnimatedContainer(
          height: MediaQuery.of(context).size.height / heightDivisor,
          curve: Curves.elasticInOut,
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
