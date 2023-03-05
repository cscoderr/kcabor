import 'package:app_models/app_models.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationException implements Exception {
  const AuthenticationException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// {@template authentication_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class AuthenticationRepository {
  /// {@macro AuthenticationRepository Login}
  Future<Either<AuthenticationException, BaseModel<UserModel>>> login({
    required String emailOrPhone,
    required String password,
  });

  /// {@macro Register}
  Future<Either<AuthenticationException, BaseModel<UserModel>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String password,
    String? refCode,
  });

  /// {@macro Verify Authenticatoin Phone Number}
  Future<Either<AuthenticationException, String>> verifyPhoneNumber({
    required String phoneNumber,
    required String countryCode,
  });

  /// {@macro AuthenticationRepository Verify Otp}
  Future<Either<AuthenticationException, BaseModel>> verifyOtp({
    required String phoneNumber,
    required String countryCode,
    required String otp,
  });

  /// {@macro AuthenticationRepository Verify Email}
  Future<Either<AuthenticationException, BaseModel>> verifyEmail({
    required String email,
    required String otp,
  });

  /// {@macro AuthenticationRepository Verify Email}
  Future<Either<AuthenticationException, BaseModel>> checkReferralCode({
    required String referralCode,
  });

  /// {@macro Resend Authentication Otp}
  Future<Either<AuthenticationException, BaseModel<String>>> resendOtp({
    required String phoneNumber,
    required String countryCode,
  });

  /// {@macro authentication_repository}
  Future<void> resetPassword();

  /// {@macro authentication_repository}
  Future<Either<AuthenticationException, BaseModel>> checkEmail({
    required String email,
  });

  /// {@macro authentication_repository}
  Future<void> checkCard();

  /// {@macro authentication_repository}
  Future<BaseModel<UserModel>> artisanSignUp();
}
