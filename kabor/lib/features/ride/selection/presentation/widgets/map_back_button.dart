import 'package:flutter/material.dart';
import 'package:kabor/core/core.dart';

class MapBackButton extends StatelessWidget {
  const MapBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 20,
      child: const AppBackButton(),
    );
  }
}
