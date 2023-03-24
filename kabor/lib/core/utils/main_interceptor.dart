import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:kabor/app/app.dart';
import 'package:kcabor_storage/kcabor_storage.dart';

final mainhttpProvider = Provider<InterceptedHttp>((ref) {
  return InterceptedHttp.build(
    interceptors: [
      MainInterceptor(
        ref: ref,
        supacelebStorage: ref.read(kcaborStorageProvider),
      ),
    ],
  );
});

class MainInterceptor extends InterceptorContract {
  // MainInterceptor.build({required super.interceptors});
  MainInterceptor({
    required this.ref,
    required this.supacelebStorage,
  });

  final Ref ref;
  final KcaborStorage supacelebStorage;

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final token = await supacelebStorage.read('kcabor_token');
    final zoneId = await supacelebStorage.read('kcabor_zone_id');
    data.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    data.headers['zoneId'] = '1';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) {
    log('----- Response -----');
    return Future.value(data);
  }
}
