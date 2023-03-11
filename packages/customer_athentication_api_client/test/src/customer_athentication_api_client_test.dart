// ignore_for_file: prefer_const_constructors

import 'package:customer_athentication_api_client/customer_athentication_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('CustomerAthenticationApiClient', () {
    test('can be instantiated', () {
      expect(
        CustomerAthenticationApiClient(baseUrl: any(named: 'baseUrl')),
        isNotNull,
      );
    });
  });
}
