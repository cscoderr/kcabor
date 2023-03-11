/// {@template athentication_api_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class AthenticationApiClient {
  /// {@macro athentication_api_client}

  //Login API
  Future<void> login();

  Future<void> logout();

  Future<void> register();
}
