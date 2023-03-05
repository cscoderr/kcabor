import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  const AuthModel({
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.password,
    this.refCode,
  });

  AuthModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? countryCode,
    String? phoneNumber,
    String? password,
    String? refCode,
  }) {
    return AuthModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      refCode: refCode ?? this.refCode,
    );
  }

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? countryCode;
  final String? phoneNumber;
  final String? refCode;
  final String? password;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        countryCode,
        phoneNumber,
        refCode,
        password,
      ];
}
