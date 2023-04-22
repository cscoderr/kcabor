import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/models/category/category.dart';
import 'package:kabor/features/food_category/food_category.dart';

// final getCategoryVMProvider = FutureProvider<List<Category>>((ref) async {
//   final response = await ref.watch(getCategoriesUsecaseProvider).call();
//   return response;
// });

class GetCategoryProvider extends AsyncNotifier<List<Category>> {
  @override
  FutureOr<List<Category>> build() {
    getCategory();
    return [];
  }

  Future<void> getCategory() async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.watch(getCategoriesUsecaseProvider).call();
      state = AsyncValue.data(response);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  List<Category> mapCategoryIdToCategory(List<int> categories) {
    if (state.value == null) return [];
    if (categories.isEmpty) return [];
    final rescategories = <Category>[];
    for (final element in state.value!) {
      if (categories.contains(int.parse(element.id!))) {
        rescategories.add(element);
      }
    }
    return rescategories;
  }
}

final getCategoryVMProvider =
    AsyncNotifierProvider<GetCategoryProvider, List<Category>>(
  GetCategoryProvider.new,
);
