import 'dart:io';

import 'package:app_models/src/models/base_model/base_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/features/menu/menu.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(
    settingsApiClient: ref.watch(settingsApiProvider),
  );
});

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsRepositoryImpl({
    required SettingsApiClient settingsApiClient,
  }) : _settingsApiClient = settingsApiClient;

  final SettingsApiClient _settingsApiClient;

  @override
  Future<BaseModel<dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    File? image,
  }) {
    return _settingsApiClient.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
    );
  }

  @override
  Future<void> updateProfileImage() {
    // TODO: implement updateProfileImage
    throw UnimplementedError();
  }
}
