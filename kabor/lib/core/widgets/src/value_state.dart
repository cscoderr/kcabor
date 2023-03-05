import 'package:flutter/material.dart';

class UseState<T> extends StatefulWidget {
  const UseState({
    super.key,
    required this.value,
    required this.listener,
  });
  final T value;
  final Widget Function(ValueNotifier<T> state) listener;

  @override
  State<UseState<T>> createState() => _UseStateState();
}

class _UseStateState<T> extends State<UseState<T>> {
  late ValueNotifier<T> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<T>(widget.value);
    _addListener();
  }

  void _addListener() {
    _valueNotifier.addListener(() {
      setState(() {
        widget.listener.call(_valueNotifier);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.listener(_valueNotifier);
}
