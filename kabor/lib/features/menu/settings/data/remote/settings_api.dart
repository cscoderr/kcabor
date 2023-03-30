import 'dart:convert';
import 'dart:io';

import 'package:app_models/app_models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:kabor/core/core.dart';

final settingsApiProvider = Provider<SettingsApiClient>((ref) {
  return SettingsApiClientImpl(httpClient: ref.watch(mainhttpProvider));
});

abstract class SettingsApiClient {
  Future<BaseModel<dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    File? image,
  });

  Future<void> updateProfileImage();
}

class SettingsApiClientImpl extends SettingsApiClient {
  SettingsApiClientImpl({
    required InterceptedHttp httpClient,
  }) : _httpClient = httpClient;

  final InterceptedHttp _httpClient;

  @override
  Future<BaseModel<dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    File? image,
  }) async {
    final response = await _httpClient.post(
      Uri.parse('${AppConstants.baseUrl}/customer/update-profile'),
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        if (image != null) 'image': image,
      },
    );

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return BaseModel.fromJson(data, (json) => null);
    }
    throw Exception('Error fetching food by category');
  }

  @override
  Future<void> updateProfileImage() {
    // TODO: implement updateProfileImage
    throw UnimplementedError();
  }
}
