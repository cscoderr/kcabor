abstract class AuthenticationRepository {
  Future<void> login();
  Future<void> register();
  Future<void> verifyPhoneNumber();
  Future<void> verifyOtp();
  Future<void> resendOtp();
  Future<void> resetPassword();
  Future<void> checkEmail();
  Future<void> checkCard();
  Future<void> artisanSignUp();
}
