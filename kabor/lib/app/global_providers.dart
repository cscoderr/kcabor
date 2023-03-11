import 'package:customer_authentication_repository/customer_authentication_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kcabor_storage/kcabor_storage.dart';

final kcaborStorageProvider = Provider<KcaborStorage>((ref) {
  return KcaborSecureStorage();
});

final authRepositoryProvider =
    Provider<CustomerAuthenticationRepository>((ref) {
  return CustomerAuthenticationRepository(
    baseUrl: AppConstants.baseUrl,
    storage: ref.watch(kcaborStorageProvider),
  );
});
