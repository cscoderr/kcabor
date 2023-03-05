import 'package:authentication_repository/src/authentication_repository.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

class FakeAuthenticationRepository extends Fake
    implements AuthenticationRepository {}

void main() {
  test('Authenticatoin class', () {
    expect(FakeAuthenticationRepository.new, returnsNormally);
  });
}
