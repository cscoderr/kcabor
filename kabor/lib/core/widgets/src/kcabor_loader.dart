import 'package:flutter/material.dart';
import 'package:kabor/core/core.dart';

class KcaborLoader extends StatefulWidget {
  const KcaborLoader({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  State<KcaborLoader> createState() => _KcaborLoaderState();
}

class _KcaborLoaderState extends State<KcaborLoader> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(
      key: _key,
      child: widget.child,
    );
    return widget.isLoading
        ? Stack(
            children: [
              child,
              const Positioned.fill(
                child: ColoredBox(
                  color: Colors.black26,
                  child: KcaborProgressIndicator(),
                ),
              ),
            ],
          )
        : child;
  }
}

class KcaborProgressIndicator extends StatelessWidget {
  const KcaborProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
        ),
      ),
    );
  }
}
