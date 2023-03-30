import 'dart:io';

import 'package:app_models/app_models.dart';

abstract class SettingsRepository {
  Future<BaseModel<dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    File? image,
  });

  Future<void> updateProfileImage();
}
