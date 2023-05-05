// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/features/menu/menu.dart';
import 'package:kabor/features/menu/settings/presentation/edit_profile/edit_profile.dart';

class EditProfileProvider extends StateNotifier<EditProfileState> {
  EditProfileProvider(this.ref) : super(const EditProfileState()) {
    updateData();
  }

  final Ref ref;

  bool get isValid {
    final user = ref.read(appVMProvider.select((value) => value.user));
    return state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.email.isNotEmpty &&
        (user.fName != state.firstName ||
            user.lName != state.lastName ||
            user.email != state.email);
  }

  void updateData() {
    final user = ref.read(appVMProvider.select((value) => value.user));
    state = state.copyWith(
      firstName: user.fName,
      lastName: user.lName,
      email: user.email,
      image: state.image ?? File(''),
    );
  }

  void onFirstNameChanged(String value) {
    state = state.copyWith(firstName: value);
  }

  void onLastNameChanged(String value) {
    state = state.copyWith(lastName: value);
  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: value);
  }

  void onImagehanged(File value) {
    state = state.copyWith(image: value);
  }

  Future<void> updateProfile() async {
    try {
      state = state.copyWith(status: EditProfileStatus.loading);
      final result = await ref.read(updateProfileUsecaseProvider).call(
            UpdateProfileParams(
              firstName: state.firstName,
              lastName: state.lastName,
              email: state.email,
              image: state.image,
            ),
          );
      state = state.copyWith(
        status: EditProfileStatus.success,
        successMessage: result.message,
      );
    } catch (e) {
      state = state.copyWith(
        status: EditProfileStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final editProfileProvider =
    StateNotifierProvider<EditProfileProvider, EditProfileState>(
  EditProfileProvider.new,
);
