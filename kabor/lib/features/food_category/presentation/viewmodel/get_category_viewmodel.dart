import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/features/food_category/food_category.dart';

final getCategoryVMProvider = FutureProvider<List<Category>>((ref) async {
  final response = await ref.watch(getCategoriesUsecaseProvider).call();
  return response;
});
