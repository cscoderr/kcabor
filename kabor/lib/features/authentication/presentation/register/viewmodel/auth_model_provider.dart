import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

final authModelProvider = StateProvider<AuthModel>(
  (ref) => const AuthModel(),
);
