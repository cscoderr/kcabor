import 'package:flutter/material.dart';
import 'package:kabor/core/core.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor4,
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: childrenWithDivider(children),
      ),
    );
  }

  List<Widget> childrenWithDivider(List<Widget> children) {
    final newChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      newChildren.add(children[i]);
      if (i != (children.length - 1)) {
        newChildren.add(const Divider());
      }
    }
    return newChildren;
  }
}
