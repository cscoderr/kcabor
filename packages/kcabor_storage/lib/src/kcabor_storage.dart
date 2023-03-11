/// {@template kcabor_storage}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class KcaborStorage {
  /// {@macro kcabor_storage}
  Future<String?> read(String key);

  /// {@macro kcabor_storage}
  Future<bool> check(String key);

  /// {@macro kcabor_storage}
  Future<void> write({required String key, required String value});

  /// {@macro kcabor_storage}
  Future<void> remove(String key);

  /// {@macro kcabor_storage}
  Future<void> clear();
}
