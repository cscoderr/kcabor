// final getCategoryVMProvider = FutureProvider.autoDispose
//     .family<CategoryModel, String>((ref, id) async {
//   final result = await ref.read(categoryRepositoryProvider).getCategory(id);
//   return result.fold((l) => throw l, (r) => r);
// });