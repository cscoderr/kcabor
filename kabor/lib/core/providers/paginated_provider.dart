import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';

abstract class PaginatedProvider<T extends Object>
    extends StateNotifier<AsyncValue<PaginatedResponse<List<T>>>> {
  PaginatedProvider(this.ref) : super(const AsyncValue.loading());

  final Ref ref;

  bool hasReachedMax = false;
  bool hasError = false;
  String errorMessage = '';

  int getOffset({
    int? offset,
    int? totalSize,
  }) {
    final pageSize = ((totalSize ?? 1) / AppConstants.appLimit).ceil();
    final newOffset = (offset ?? 1) < pageSize ? (offset ?? 1) + 1 : 1;
    return newOffset;
  }

  Future<void> onRequest(
    Future<PaginatedResponse<List<T>>> Function() request, {
    bool hasLoader = true,
    int? totalSize,
    required int offset,
  }) async {
    if (hasLoader) {
      state = const AsyncValue.loading();
    }
    try {
      final response = await request();
      final currentData = state.asData?.value.data ?? [];
      final data = response.data ?? [];
      final newData = [...currentData, ...data];
      final newResponse = response.copyWith(
        data: newData,
      );
      hasReachedMax = data.length < AppConstants.appLimit;
      state = AsyncValue.data(newResponse);
    } catch (e) {
      if (hasLoader) {
        state = AsyncValue.error(e, StackTrace.current);
      } else {
        hasError = true;
        errorMessage = e.toString();
      }
    }
  }
}
