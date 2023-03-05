import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabor/core/core.dart';

class BaseStateProvider<T extends Object> extends StateNotifier<BaseState<T>> {
  BaseStateProvider() : super(const BaseState.intial());

  void initial() {
    state = const BaseState.intial();
  }

  void loading() {
    state = const BaseState.loading();
  }

  void error(String error) {
    state = BaseState.error(error);
  }

  void success(T data) {
    state = BaseState.success(data);
  }
}
