// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resendOtpHash() => r'40d4be2a255147e671a79e2c61808e1adeb63a74';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ResendOtpRef = AutoDisposeFutureProviderRef<String>;

/// See also [resendOtp].
@ProviderFor(resendOtp)
const resendOtpProvider = ResendOtpFamily();

/// See also [resendOtp].
class ResendOtpFamily extends Family<AsyncValue<String>> {
  /// See also [resendOtp].
  const ResendOtpFamily();

  /// See also [resendOtp].
  ResendOtpProvider call({
    required String phone,
    required String countryCode,
  }) {
    return ResendOtpProvider(
      phone: phone,
      countryCode: countryCode,
    );
  }

  @override
  ResendOtpProvider getProviderOverride(
    covariant ResendOtpProvider provider,
  ) {
    return call(
      phone: provider.phone,
      countryCode: provider.countryCode,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'resendOtpProvider';
}

/// See also [resendOtp].
class ResendOtpProvider extends AutoDisposeFutureProvider<String> {
  /// See also [resendOtp].
  ResendOtpProvider({
    required this.phone,
    required this.countryCode,
  }) : super.internal(
          (ref) => resendOtp(
            ref,
            phone: phone,
            countryCode: countryCode,
          ),
          from: resendOtpProvider,
          name: r'resendOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resendOtpHash,
          dependencies: ResendOtpFamily._dependencies,
          allTransitiveDependencies: ResendOtpFamily._allTransitiveDependencies,
        );

  final String phone;
  final String countryCode;

  @override
  bool operator ==(Object other) {
    return other is ResendOtpProvider &&
        other.phone == phone &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, countryCode.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
