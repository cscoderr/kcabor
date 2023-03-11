// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:customer_authentication_repository/customer_authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:kcabor_storage/kcabor_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockKcaborStorage extends Mock implements KcaborStorage {}

void main() {
  late MockHttpClient mockHttpClient;
  late MockKcaborStorage mockKcaborStorage;
  late CustomerAuthenticationRepository customerAuthenticationRepository;
  setUp(() {
    mockHttpClient = MockHttpClient();
    mockKcaborStorage = MockKcaborStorage();
    customerAuthenticationRepository = CustomerAuthenticationRepository(
      baseUrl: 'baseUrl',
      httpClient: mockHttpClient,
      storage: mockKcaborStorage,
    );
  });

  setUpAll(() {
    registerFallbackValue(Uri());
  });
  group('CustomerAuthenticationRepository', () {
    test('can be instantiated', () {
      expect(
        CustomerAuthenticationRepository(
          baseUrl: 'baseUrl',
          storage: mockKcaborStorage,
        ),
        isNotNull,
      );
    });

    group('Verify Phone Number', () {
      test('should Verify Phone Number called http POST request', () {
        when(
          () => mockHttpClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode('success'),
            200,
          ),
        );
        customerAuthenticationRepository.verifyPhoneNumber(
          phoneNumber: 'phoneNumber',
          countryCode: 'countryCode',
        );
        verify(
          () => mockHttpClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          ),
        ).called(1);
      });

      test('should verify phone number throws exception', () {});
    });
  });
}
