import 'dart:convert';
import 'dart:io';

import 'package:app_models/app_models.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kcabor_storage/kcabor_storage.dart';

class AuthFailure {
  const AuthFailure._(this.value);

  const AuthFailure.serverError() : this._(0);

  const AuthFailure.invalidEmailAndPassword() : this._(1);

  final int value;
}

/// {@template customer_authentication_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class CustomerAuthenticationRepository implements AuthenticationRepository {
  /// {@macro customer_authentication_repository}
  CustomerAuthenticationRepository({
    required String baseUrl,
    KcaborStorage? storage,
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        _storage = storage ?? KcaborSecureStorage(),
        _baseUrl = baseUrl;

  final http.Client _httpClient;
  final KcaborStorage _storage;
  final String _baseUrl;

  @override
  Future<BaseModel<UserModel>> artisanSignUp() async {
    return const BaseModel<UserModel>(status: true, message: 'success');
  }

  @override
  Future<void> checkCard() {
    // TODO: implement checkCard
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthenticationException, BaseModel<UserModel>>> login({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      final body = {
        'phone_or_email': emailOrPhone,
        'password': password,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        await _storage.write(
          key: 'kcabor_token',
          value: data['token'] as String,
        );
        final user = data['data'] as Map<String, dynamic>;
        await _storage.write(
          key: 'kcabor_user',
          value: jsonEncode(user),
        );
        return right(
          BaseModel.fromJson(
            data,
            (json) {
              return UserModel.fromJson(json as Map<String, dynamic>);
            },
          ),
        );
      } else if (response.statusCode == HttpStatus.badRequest) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, BaseModel<String>>> resendOtp({
    required String phoneNumber,
    required String countryCode,
  }) async {
    try {
      final body = {
        'phone': phoneNumber,
        'country_code': countryCode,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/resend-sms-otp'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        return right(
          BaseModel.fromJson(data, (json) {
            final message = data['message'] as String;
            return message;
          }),
        );
      } else if (response.statusCode == HttpStatus.badRequest) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }

  @override
  Future<void> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthenticationException, BaseModel<String>>> verifyOtp({
    required String phoneNumber,
    required String countryCode,
    required String otp,
  }) async {
    try {
      final body = {
        'otp': otp,
        'phone': phoneNumber,
        'country_code': countryCode,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/verify-sms-otp'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        return right(
          BaseModel.fromJson(data, (json) {
            final message = data['message'] as String;
            return message;
          }),
        );
      } else if (response.statusCode == HttpStatus.badRequest ||
          response.statusCode == HttpStatus.notFound) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, String>> verifyPhoneNumber({
    required String phoneNumber,
    required String countryCode,
  }) async {
    try {
      final body = {
        'phone': phoneNumber,
        'country_code': countryCode,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/check-phone'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final message = data['message'] as String;
        return right(message);
      } else if (response.statusCode == HttpStatus.badRequest) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, BaseModel>> checkReferralCode({
    required String referralCode,
  }) {
    // TODO: implement checkReferralCode
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthenticationException, BaseModel>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final body = {
        'email': email,
        'otp': otp,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/verify-email-otp'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        return right(
          BaseModel.fromJson(data, (json) {
            final message = data['message'] as String;
            return message;
          }),
        );
      } else if (response.statusCode == HttpStatus.badRequest) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, BaseModel>> checkEmail({
    required String email,
  }) async {
    try {
      final body = {
        'email': email,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/check-email'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(response.body);

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        return right(
          BaseModel.fromJson(data, (json) {
            final message = data['message'] as String;
            return message;
          }),
        );
      } else if (response.statusCode == HttpStatus.badRequest) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }

  @override
  Future<Either<AuthenticationException, BaseModel<UserModel>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String password,
    String? refCode,
  }) async {
    try {
      final body = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'country_code': countryCode,
        'phone': phoneNumber,
        'password': password,
        'ref_code': refCode,
      };

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/auth/sign-up'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        await _storage.write(
          key: 'kcabor_token',
          value: data['token'] as String,
        );
        final user = data['data'] as Map<String, dynamic>;
        await _storage.write(
          key: 'kcabor_user',
          value: jsonEncode(user),
        );

        return right(
          BaseModel.fromJson(data, (json) {
            return UserModel.fromJson(json as Map<String, dynamic>);
          }),
        );
      } else if (response.statusCode == HttpStatus.badRequest) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = data['errors'] as List;
        return left(
          AuthenticationException(
            (errors.first as Map<String, dynamic>)['message'] as String,
          ),
        );
      }
      return left(const AuthenticationException('An error occur'));
    } catch (e) {
      return left(AuthenticationException(e.toString()));
    }
  }
}
