import 'dart:io';

import 'package:equatable/equatable.dart';

enum EditProfileStatus { initial, loading, success, error }

class EditProfileState extends Equatable {
  const EditProfileState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.image,
    this.status = EditProfileStatus.initial,
    this.errorMessage = '',
    this.successMessage = '',
  });

  EditProfileState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    File? image,
    EditProfileStatus? status,
    String? errorMessage,
    String? successMessage,
  }) {
    return EditProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      image: image ?? this.image,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  final String firstName;
  final String lastName;
  final String email;
  final File? image;
  final EditProfileStatus status;
  final String errorMessage;
  final String successMessage;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        image,
        status,
        errorMessage,
        successMessage,
      ];
}
