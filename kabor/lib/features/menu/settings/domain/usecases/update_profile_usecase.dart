import 'dart:io';

import 'package:app_models/app_models.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/menu.dart';

final updateProfileUsecaseProvider = Provider<UpdateProfileUsecase>(
  (ref) => UpdateProfileUsecase(
    ref.watch(settingsRepositoryProvider),
  ),
);

class UpdateProfileUsecase
    extends Usecases<BaseModel<dynamic>, UpdateProfileParams> {
  UpdateProfileUsecase(this.repository);

  SettingsRepository repository;

  @override
  Future<BaseModel<dynamic>> call(UpdateProfileParams params) async {
    return repository.updateProfile(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
    );
  }
}

class UpdateProfileParams extends Equatable {
  const UpdateProfileParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.image,
  });

  final String firstName;
  final String lastName;
  final String email;
  final File? image;

  @override
  List<Object?> get props => [firstName, lastName, email, image];
}
