import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kabor/core/core.dart';

class AdaptivePrimaryButton extends StatelessWidget {
  const AdaptivePrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: MaterialBasedCupertinoThemeData(
          materialTheme: Theme.of(context),
        ),
        child: CupertinoButton.filled(
          borderRadius: BorderRadius.circular(34),
          child: const Text('tommy'),
          onPressed: () {},
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {},
        child: const Text('click me'),
      );
    }
  }
}

class AdaptiveOutlineButton extends StatelessWidget {
  const AdaptiveOutlineButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: MaterialBasedCupertinoThemeData(
          materialTheme: Theme.of(context),
        ),
        child: CupertinoButton(child: const Text('tommy'), onPressed: () {}),
      );
    } else {
      return OutlinedButton(
        onPressed: () {},
        child: const Text('click me'),
      );
    }
  }
}

class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: context.$style.titleMedium,
          ),
        ),
      ),
    );
  }
}
