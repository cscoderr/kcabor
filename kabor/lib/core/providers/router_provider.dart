import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = ChangeNotifierProvider<RouterProvider>((ref) {
  return RouterProvider(ref: ref);
});

class RouterProvider extends ChangeNotifier {
  RouterProvider({required Ref ref}) : _ref = ref {
    // _ref.listen<LoginState>(
    //   loginControllerProvider,
    //   (_, __) => notifyListeners(),
    // );
  }

  final Ref _ref;

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    return null;
  }
}
