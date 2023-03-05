import 'package:customer_authentication_repository/customer_authentication_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';

final customerAuthRepositoryProvider =
    Provider<CustomerAuthenticationRepository>((ref) {
  return CustomerAuthenticationRepository(
    baseUrl: AppConstants.baseUrl,
  );
});
