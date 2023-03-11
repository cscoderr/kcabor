import 'dart:async';

import 'package:flutter/material.dart';

class AppRouterRefreshStream extends ChangeNotifier {
  AppRouterRefreshStream(Stream<dynamic> stream) {
    _streamSubscription = stream.asBroadcastStream().listen((event) {
      notifyListeners();
    });
  }
  late final StreamSubscription<dynamic> _streamSubscription;

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
