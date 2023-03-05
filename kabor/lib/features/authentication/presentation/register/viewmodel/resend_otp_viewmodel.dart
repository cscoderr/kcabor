import 'package:kabor/app/app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resend_otp_viewmodel.g.dart';

@riverpod
Future<String> resendOtp(
  ResendOtpRef ref, {
  required String phone,
  required String countryCode,
}) async {
  final result =
      await ref.read(customerAuthRepositoryProvider).verifyPhoneNumber(
            phoneNumber: phone,
            countryCode: '234',
          );
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
