import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kcabor_storage/kcabor_storage.dart';

/// A Very Good Project created by Very Good CLI.
class KcaborSecureStorage extends KcaborStorage {
  /// {@macro kcabor_storage}
  KcaborSecureStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<bool> check(String key) async {
    final response = await _storage.containsKey(key: key);
    final data = await read(key);
    return response && data != null;
  }

  @override
  Future<void> clear() => _storage.deleteAll();

  @override
  Future<void> remove(String key) => _storage.delete(key: key);

  @override
  Future<void> write({required String key, required String value}) =>
      _storage.write(key: key, value: value);
}
